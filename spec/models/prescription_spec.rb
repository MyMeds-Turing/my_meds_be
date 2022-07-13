# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Prescription, type: :model do
  context 'validations' do
    it { should validate_presence_of :med_name }
    it { should validate_presence_of :time_of_last_dose }
    it { should validate_presence_of :time_of_next_dose }
    it { should validate_presence_of :total_doses }
    it { should validate_presence_of :doses_remaining }
    it { should validate_presence_of :max_daily_doses }
    it { should validate_presence_of :dose }
    it { should validate_presence_of :user_instructions }
    it { should validate_presence_of :additional_instructions }
    it { should validate_presence_of :time_between_dose }
    it { should validate_presence_of :icon }
  end
end
