# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Prescription, type: :model do
  context 'validations' do
    it { should validate_presence_of :med_name }
    it { should validate_presence_of :user_id }
  end
  describe '#set_doses_remaining' do
    it 'auto-populates set_doses_remaining to total_doses' do
      user = User.create!(id: 1, first_name: 'John', last_name: 'L', email: 'John.L@email.com',
                          sms: '5551234567', notify: 3, password: 'passwd', password_confirmation: 'passwd')

      rx = Prescription.create!(user_id: user.id, med_name: 'Tylenol', total_doses: 500,
                                max_daily_doses: 6, dose: '200 mg', user_instructions: 'take pill, take with food',
                                additional_instructions: 'take 2 call me in the morning', time_between_dose: 240,
                                icon: 'path_to_icon')

      expect(rx.doses_remaining).to eq(rx.total_doses)
    end
  end
end
