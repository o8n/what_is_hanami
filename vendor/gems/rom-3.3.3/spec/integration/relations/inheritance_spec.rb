require 'spec_helper'

RSpec.describe 'Inheritance relation hierarchy' do
  include_context 'container'

  before do
    module Test
      class Users < ROM::Relation[:memory]
        dataset :users

        def by_email(email)
          restrict(email: email)
        end
      end

      class OtherUsers < Users
        register_as :other_users
      end
    end

    configuration.register_relation(Test::Users, Test::OtherUsers)
  end

  it 'registers parent and descendant relations' do
    users = container.relation(:users)
    other_users = container.relation(:other_users)

    expect(users).to be_instance_of(Test::Users)
    expect(other_users).to be_instance_of(Test::OtherUsers)

    jane = { name: 'Jane', email: 'jane@doe.org' }

    other_users.insert(jane)

    expect(other_users.by_email('jane@doe.org').one).to eql(jane)
  end
end
