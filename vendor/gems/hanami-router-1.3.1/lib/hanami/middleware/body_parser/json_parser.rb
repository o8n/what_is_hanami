require 'hanami/utils/json'
require_relative 'errors'

module Hanami
  module Middleware
    class BodyParser
      # @since 1.3.0
      # @api private
      class JsonParser
        # @since 1.3.0
        # @api private
        def mime_types
          ['application/json', 'application/vnd.api+json']
        end

        # Parse a json string
        #
        # @param body [String] a json string
        #
        # @return [Hash] the parsed json
        #
        # @raise [Hanami::Middleware::BodyParser::BodyParsingError] when the body can't be parsed.
        #
        # @since 1.3.0
        # @api private
        def parse(body)
          Hanami::Utils::Json.parse(body)
        rescue Hanami::Utils::Json::ParserError => e
          raise BodyParsingError.new(e.message)
        end
      end
    end
  end
end
