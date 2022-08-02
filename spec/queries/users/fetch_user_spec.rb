# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'display users' do
    it 'can query a single user by id' do
      User.create!(id: 1, first_name: 'John', last_name: 'L', email: 'John.L@email.com',
                   sms: '5551234567', notify: 3, password: 'passwd', password_confirmation: 'passwd')
      User.create!(id: 2, first_name: 'Paul', last_name: 'M', email: 'Paul.M@email.com',
                   sms: '5551234567', notify: 3, password: 'passwd', password_confirmation: 'passwd')

      result = MyMedsBeSchema.execute(query).as_json
      expect(result['data']['fetchUser'].count).to eq(9)
      expect(result['data']['fetchUser']['fullName']).to eq('John L')
    end
    it 'returns an error response for user not found' do
      result = MyMedsBeSchema.execute(query).as_json
      expect(result['errors'][0]['message']).to eq('User does not exist.')
    end
    it 'returns an error response for invaild attribute' do
      result = MyMedsBeSchema.execute(missing_attribute_query).as_json
      expect(result['errors'][0]['message']).to eq("Field 'foo' doesn't exist on type 'User'")
    end
  end

  def query
    <<~GQL
      {
        fetchUser(id: "1") {
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
