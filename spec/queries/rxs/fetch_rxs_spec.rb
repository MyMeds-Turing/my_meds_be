# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'display users' do
    it 'can return all prescriptions for a user  ' do
      user = User.create!(id: 1, first_name: 'John', last_name: 'L', email: 'John.L@email.com',
                          sms: '5551234567', notify: 3, password: 'passwd', password_confirmation: 'passwd')

      Prescription.create!(user_id: user.id, med_name: 'Tylenol', time_of_last_dose: Time.current,
                           time_of_next_dose: 1.days.from_now, total_doses: 500, doses_remaining: 500,
                           max_daily_doses: 6, dose: '200 mg', user_instructions: 'take pill, take with food',
                           additional_instructions: 'take 2 call me in the morning', time_between_dose: 240,
                           icon: 'path_to_icon')

      result = MyMedsBeSchema.execute(query).as_json
      expect(result['data']['fetchRxs'].count).to eq(1)
      expect(result['data']['fetchRxs'][0]['medName']).to eq('Tylenol')
    end
  end

  def query
    <<~GQL
      {
        fetchRxs {
          id
          medName
          timeOfLastDose
          timeOfNextDose
          totalDoses
          dosesRemaining
          maxDailyDoses
          dose
          userInstructions
          additionalInstructions
          timeBetweenDose
          icon
          userId
          createdAt
          updatedAt
        }
      }
    GQL
  end
end
