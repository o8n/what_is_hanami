require 'spec_helper'

RSpec.describe 'Commands / Delete' do
  include_context 'container'
  include_context 'users and tasks'

  subject(:users) { container.commands.users }

  before do
    configuration.relation(:users) do
      def by_name(name)
        restrict(name: name)
      end
    end
  end

  it 'deletes all tuples when there is no restriction' do
    configuration.commands(:users) do
      define(:delete)
    end

    result = users.try { users.delete.call }

    expect(result).to match_array([
      { name: 'Jane', email: 'jane@doe.org' },
      { name: 'Joe', email: 'joe@doe.org' }
    ])

    expect(container.relation(:users)).to match_array([])
  end

  it 'deletes tuples matching restriction' do
    configuration.commands(:users) do
      define(:delete)
    end

    result = users.try { users.delete.by_name('Joe').call }

    expect(result).to match_array([{ name: 'Joe', email: 'joe@doe.org' }])

    expect(container.relation(:users)).to match_array([
      { name: 'Jane', email: 'jane@doe.org' }
    ])
  end

  it 'returns untouched relation if there are no tuples to delete' do
    configuration.commands(:users) do
      define(:delete)
    end

    result = users.try { users.delete.by_name('Not here').call }

    expect(result).to match_array([])
  end

  it 'returns deleted tuple when result is set to :one' do
    configuration.commands(:users) do
      define(:delete_one, type: :delete) do
        result :one
      end
    end

    result = users.try { users.delete_one.by_name('Jane').call }

    expect(result.value).to eql(name: 'Jane', email: 'jane@doe.org')
  end
end
