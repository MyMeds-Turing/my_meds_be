# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Types::MutationType do
  describe 'takeMed' do
    it 'updates all timed attributes for rx and subtracts one from total count' do
      user = User.create!(id: 1, first_name: 'test', last_name: 'man', email: 'guy@test.com',
                          sms: '2223334444', notify: 0)

      rx = Prescription.create!(user_id: user.id, med_name: 'Tylenol', time_of_last_dose: Time.current,
                                time_of_next_dose: 1.days.from_now, total_doses: 500, doses_remaining: 500,
                                max_daily_doses: 6, dose: '200 mg', user_instructions: 'take pill, take with food',
                                additional_instructions: 'take 2 call me in the morning', time_between_dose: 240,
                                icon: 'path_to_icon', id: 1)

      expect(rx.doses_remaining).to eq(500)
      result = MyMedsBeSchema.execute(mutation).as_json

      expect(result['data']['takeMed']['dosesRemaining']).to eq(499)
      expect(result['data']['takeMed'].keys.count).to eq(5)
      expect(result['data']['takeMed']['id']).to eq('1')
      expect(result['data']['takeMed']).to have_key('id')
      expect(result['data']['takeMed']).to have_key('medName')
      expect(result['data']['takeMed']).to have_key('timeOfLastDose')
      expect(result['data']['takeMed']).to have_key('timeOfNextDose')
      expect(result['data']['takeMed']).to have_key('dosesRemaining')
    end
  end

  def mutation
    <<~GQL
      mutation {
        takeMed(input: {id: 1}  ) {
          id
          medName
          timeOfLastDose
          timeOfNextDose
          dosesRemaining
        }
      }
    GQL
  end
end
