# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Types::MutationType do
  describe 'addUser' do
    it 'add / create a user' do
      user = User.create!(id: 1, first_name: 'test', last_name: 'man', email: 'guy@test.com',
                          sms: '2223334444', notify: 0, password: 'passwd', password_confirmation: 'passwd')
      expect(User.all.count).to eq(1)
      result = MyMedsBeSchema.execute(mutation).as_json

      expect(User.all.count).to eq(2)
      expect(result['data']['addUser']['user']['email']).to eq('john.lennon@email.com')
      expect(result['data']['addUser']['user']['notify']).to eq(0)
      expect(User.find(result['data']['addUser']['user']['id']).notify).to eq('sms_only')
    end
  end
  def mutation
    <<~GQL
      mutation {
        addUser( input: {
          params: {
            firstName: "John",
            lastName: "Lennon",
            email: "john.lennon@email.com",
            password: "passwd",
            passwordConfirmation: "passwd",
            sms: "5551234567",
            notify: 2
          }
        }) {
          user {
            id
            email
            notify
          }
        }
      }
    GQL
  end
end
