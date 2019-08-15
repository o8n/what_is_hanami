require 'hanami/utils/string'

module Hanami
  module Routing
    # Represents a result of router path recognition.
    #
    # @since 0.5.0
    #
    # @see Hanami::Router#recognize
    class RecognizedRoute
      # @since 0.5.0
      # @api private
      REQUEST_METHOD = 'REQUEST_METHOD'.freeze

      # @since 0.7.0
      # @api private
      PATH_INFO      = 'PATH_INFO'.freeze

      # @since 0.5.0
      # @api private
      NAMESPACE             = '%s::'.freeze

      # @since 0.5.0
      # @api private
      NAMESPACE_REPLACEMENT = ''.freeze

      # @since 0.5.0
      # @api private
      ACTION_PATH_SEPARATOR = '/'.freeze

      # @since 0.5.0
      # @api public
      attr_reader :params

      # Creates a new instance
      #
      # @param response [HttpRouter::Response] raw response of recognition
      # @param env [Hash] Rack env
      # @param router [Hanami::Routing::HttpRouter] low level router
      #
      # @return [Hanami::Routing::RecognizedRoute]
      #
      # @since 0.5.0
      # @api private
      def initialize(response, env, router)
        @env      = env
        @endpoint = nil
        @params   = {}

        unless response.nil?
          @endpoint = response.route.dest
          @params   = response.params
        end

        @namespace        = router.namespace
        @action_separator = router.action_separator
      end

      # Rack protocol compatibility
      #
      # @param env [Hash] Rack env
      #
      # @return [Array] serialized Rack response
      #
      # @raise [Hanami::Router::NotRoutableEndpointError] if not routable
      #
      # @since 0.5.0
      # @api public
      #
      # @see Hanami::Routing::RecognizedRoute#routable?
      # @see Hanami::Router::NotRoutableEndpointError
      def call(env)
        if routable?
          @endpoint.call(env)
        else
          raise Hanami::Router::NotRoutableEndpointError.new(@env)
        end
      end

      # HTTP verb (aka method)
      #
      # @return [String]
      #
      # @since 0.5.0
      # @api public
      def verb
        @env[REQUEST_METHOD]
      end

      # Relative URL (path)
      #
      # @return [String]
      #
      # @since 0.7.0
      # @api public
      def path
        @env[PATH_INFO]
      end

      # Action name
      #
      # @return [String]
      #
      # @since 0.5.0
      # @api public
      #
      # @see Hanami::Router#recognize
      #
      # @example
      #   require 'hanami/router'
      #
      #   router = Hanami::Router.new do
      #     get '/books/:id', to: 'books#show'
      #   end
      #
      #   puts router.recognize('/books/23').action # => "books#show"
      def action
        return if !routable? || redirect?
        namespace = NAMESPACE % @namespace

        if destination.match(namespace)
          Hanami::Utils::String.transform(
            destination.sub(namespace, NAMESPACE_REPLACEMENT),
            :underscore, [:rsub, ACTION_PATH_SEPARATOR, @action_separator])
        else
          destination
        end
      end

      # Check if routable
      #
      # @return [TrueClass,FalseClass]
      #
      # @since 0.5.0
      # @api public
      #
      # @see Hanami::Router#recognize
      #
      # @example
      #   require 'hanami/router'
      #
      #   router = Hanami::Router.new do
      #     get '/', to: 'home#index'
      #   end
      #
      #   puts router.recognize('/').routable?    # => true
      #   puts router.recognize('/foo').routable? # => false
      def routable?
        @endpoint&.routable? || false
      end

      # Check if redirect
      #
      # @return [TrueClass,FalseClass]
      #
      # @since 1.0.1
      # @api public
      #
      # @see Hanami::Router#recognize
      #
      # @example
      #   require 'hanami/router'
      #
      #   router = Hanami::Router.new do
      #     get '/', to: 'home#index'
      #     redirect '/home', to: '/'
      #   end
      #
      #   puts router.recognize('/home').redirect? # => true
      #   puts router.recognize('/').redirect?     # => false
      def redirect?
        @endpoint&.redirect? || false
      end

      # Returns the redirect destination path
      #
      # @return [String,NilClass] the destination path, if it's a redirect
      #
      # @since 1.0.1
      # @api public
      #
      # @see Hanami::Router#recognize
      # @see #redirect?
      #
      # @example
      #   require 'hanami/router'
      #
      #   router = Hanami::Router.new do
      #     get '/', to: 'home#index'
      #     redirect '/home', to: '/'
      #   end
      #
      #   puts router.recognize('/home').destination_path # => "/"
      #   puts router.recognize('/').destination_path     # => nil
      def redirection_path
        @endpoint&.destination_path
      end

      private

      # @since 0.5.0
      # @api private
      #
      # @see Hanami::Routing::Endpoint
      def destination
        @destination ||= begin
          case k = @endpoint.__getobj__
          when Class
            k.name
          when Proc
            @endpoint.inspect
          else
            k.class.name
          end
        end
      end
    end
  end
end
