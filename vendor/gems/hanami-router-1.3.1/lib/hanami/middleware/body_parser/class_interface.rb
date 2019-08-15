require 'hanami/utils/class'
require 'hanami/utils/string'
require_relative 'errors'

 module Hanami
   module Middleware
     class BodyParser
       # @api private
       # @since 1.3.0
       module ClassInterface
         # @api private
         # @since 1.3.0
         def for(parser)
           parser =
             case parser
             when String, Symbol
               require_parser(parser)
             when Class
               parser.new
             else
               parser
             end

           ensure_parser parser

           parser
         end

         private

         # @api private
         # @since 1.3.0
         PARSER_METHODS = %i[mime_types parse].freeze

         # @api private
         # @since 1.3.0
         def ensure_parser(parser)
           unless PARSER_METHODS.all? { |method| parser.respond_to?(method) }
             raise InvalidParserError.new(parser)
           end
         end

         # @api private
         # @since 1.3.0
         def require_parser(parser)
           require "hanami/middleware/body_parser/#{parser}_parser"

           parser = Utils::String.classify(parser)
           Utils::Class.load!("Hanami::Middleware::BodyParser::#{parser}Parser").new
         rescue LoadError, NameError
           raise UnknownParserError.new(parser)
         end
       end
     end
   end
 end
