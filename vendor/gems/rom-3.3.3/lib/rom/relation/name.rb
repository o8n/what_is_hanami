require 'dry/equalizer'
require 'concurrent/map'

module ROM
  class Relation
    # Relation name container
    #
    # This is a simple struct with two fields.
    # It handles both relation registration name (i.e. Symbol) and dataset name.
    # The reason we need it is a simplification of passing around these two objects.
    # It is quite common to have a dataset named differently from a relation
    # built on top if you are dealing with a legacy DB and often you need both
    # to support things such as associations (rom-sql as an example).
    #
    # @api private
    class Name
      include Dry::Equalizer(:relation, :dataset)

      # Coerce an object to a Name instance
      #
      # @return [ROM::Relation::Name]
      #
      # @api private
      def self.[](*args)
        cache.fetch_or_store(args.hash) do
          relation, dataset = args

          if relation.is_a?(Name)
            relation
          else
            new(relation, dataset)
          end
        end
      end

      # @api private
      def self.cache
        @cache ||= Concurrent::Map.new
      end

      # Relation registration name
      #
      # @return [Symbol]
      #
      # @api private
      attr_reader :relation

      # Underlying dataset name
      #
      # @return [Symbol]
      #
      # @api private
      attr_reader :dataset

      # @api private
      def initialize(relation, dataset = nil)
        @relation = relation
        @dataset = dataset || relation
      end

      # Return relation name
      #
      # @return [String]
      #
      # @api private
      def to_s
        if relation == dataset
          relation.to_s
        else
          "#{relation} on #{dataset}"
        end
      end

      # Alias for registration key implicitly called by ROM::Registry
      #
      # @return [Symbol]
      #
      # @api private
      def to_sym
        relation
      end

      # Return inspected relation
      #
      # @return [String]
      #
      # @api private
      def inspect
        "#{self.class.name}(#{to_s})"
      end

      # Build a new name. Useful for Curried and other relation proxies
      #
      # @return [ROM::Relation::Name]
      #
      # @api private
      def with(relation)
        self.class[relation, dataset]
      end
    end
  end
end
