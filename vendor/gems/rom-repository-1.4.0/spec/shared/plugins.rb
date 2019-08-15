RSpec.shared_context 'plugins' do
  before do
    module Test
      class WrappingInput
        def initialize(input)
          @input = input || Hash
        end
      end

      module Timestamps
        class InputWithTimestamp < WrappingInput
          def [](value)
            v = @input[value]
            now = Time.now

            if v[:created_at]
              v.merge(updated_at: now)
            else
              v.merge(created_at: now, updated_at: now)
            end
          end
        end

        module ClassInterface
          def build(relation, options = {})
            super(relation, options.merge(input: InputWithTimestamp.new(input)))
          end
        end

        def self.included(klass)
          super

          klass.extend ClassInterface
        end
      end

      module UpcaseName
        class UpcaseNameInput < WrappingInput
          def [](value)
            v = @input[value]
            v.merge(name: value.fetch(:name).upcase)
          end
        end

        module ClassInterface
          def build(relation, options = {})
            super(relation, options.merge(input: UpcaseNameInput.new(options.fetch(:input))))
          end
        end

        def self.included(klass)
          super

          klass.extend ClassInterface
        end
      end
    end

    ROM.plugins do
      adapter :sql do
        register :timestamps, Test::Timestamps, type: :command
        register :upcase_name, Test::UpcaseName, type: :command
      end
    end
  end
end
