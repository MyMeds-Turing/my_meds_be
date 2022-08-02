# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'display users' do
    it 'can query all users' do
      User.create!(first_name: 'John', last_name: 'L', email: 'John.L@email.com',
                   sms: '5551234567', notify: 3, password: 'passwd', password_confirmation: 'passwd')

      User.create!(first_name: 'Paul', last_name: 'M', email: 'Paul.M@email.com',
                   sms: '5551234567', notify: 3, password: 'passwd', password_confirmation: 'passwd')

      result = MyMedsBeSchema.execute(query).as_json
      expect(result['data']['fetchUsers'].count).to eq(2)
      expect(result['data']['fetchUsers'][0]['fullName']).to eq('John L')
      expect(result['data']['fetchUsers'][1]['fullName']).to eq('Paul M')
    end
    # it 'returns an error response for invaild attribute' do
    #  result = MyMedsBeSchema.execute(query).as_json
    #  expect(result['errors'][0]['message']).to eq('Users do not exist.')
    # end
  end

  def query
    <<~GQL
      {
        fetchUsers {
          id
          firstName
          lastName
          fullName
          email
          sms
          notify
          createdAt
          updatedAt
          }
      }
    GQL
  end

  def missing_attribute_query
    <<~GQL
      {
        fetchUser(id: "1") {
          foo
          }
      }
    GQL
  end
end
