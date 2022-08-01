# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of :notify }
    it { should validate_presence_of :password }
    it { should validate_presence_of :password_confirmation }
  end

  context 'relationships' do
    it { should have_many(:prescriptions) }
  end
end
