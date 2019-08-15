require 'spec_helper'
require 'dry-struct'

RSpec.describe 'Commands / Update' do
  include_context 'container'
  include_context 'users and tasks'

  subject(:users) { container.commands.users }

  before do
    configuration.relation(:users) do
      register_as :users

      def all(criteria)
        restrict(criteria)
      end

      def by_name(name)
        restrict(name: name)
      end
    end

    configuration.commands(:users) do
      define(:update)
    end
  end

  it 'update tuples' do
    result = users.try {
      users.update.all(name: 'Jane').call(email: 'jane.doe@test.com')
    }

    expect(result)
      .to match_array([{ name: 'Jane', email: 'jane.doe@test.com' }])
  end

  describe '"result" option' do
    it 'returns a single tuple when set to :one' do
      configuration.commands(:users) do
        define(:update_one, type: :update) do
          result :one
        end
      end

      result = users.try {
        users.update_one.by_name('Jane').call(email: 'jane.doe@test.com')
      }

      expect(result.value).to eql(name: 'Jane', email: 'jane.doe@test.com')
    end

    it 'allows only valid result types' do
      expect {
        configuration.commands(:users) do
          define(:create_one, type: :create) do
            result :invalid_type
          end
        end
        container
      }.to raise_error(Dry::Types::ConstraintError)
    end
  end

  describe 'piping results through mappers' do
    it 'allows scoping to a virtual relation' do
      user_model = Class.new(Dry::Struct) {
        attribute :name, Types::String
        attribute :email, Types::String
      }

      configuration.mappers do
        define(:users) do
          model user_model
          register_as :entity
        end
      end

      command = container.command(:users).as(:entity).update.by_name('Jane')

      attributes = { name: 'Jane Doe', email: 'jane@doe.org' }
      result = command[attributes]

      expect(result).to eql([user_model.new(attributes)])
    end
  end
end
