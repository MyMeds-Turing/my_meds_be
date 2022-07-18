require 'rails_helper'

RSpec.describe Types::MutationType do
  describe 'delete rx' do
    it 'can remove a rx from the database  ' do
      user = User.create!(id: 1, first_name: 'test', last_name: 'man', email: 'guy@test.com',
                          sms: '2223334444', notify: 3)

      Prescription.create!(user_id: user.id, med_name: 'Tylenol', time_of_last_dose: Time.current,
                           time_of_next_dose: 1.days.from_now, total_doses: 500, doses_remaining: 500,
                           max_daily_doses: 6, dose: '200 mg', user_instructions: 'take pill, take with food',
                           additional_instructions: 'take 2 call me in the morning', time_between_dose: 240,
                           icon: 'path_to_icon')

      result = MyMedsBeSchema.execute(mutation).as_json
      binding.pry
      expect(result['data']['deleteRx'].count).to eq(1)
      expect(result['data']['fetchRxs'][0]['medName']).to eq('Tylenol')
    end
  end

  def mutation
    <<~GQL
      {
        deleteRx(input: {id: 1}  ) {
          id
        }
      }
    GQL
  end
end
