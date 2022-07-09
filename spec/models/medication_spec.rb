# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Medication, type: :model do
  context 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :dose }
    it { should validate_presence_of :time_between_dose }
  end
end
