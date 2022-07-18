# frozen_string_literal: true

# app/models/prescription.rb
class Prescription < ApplicationRecord
  validates_presence_of :med_name
  #  validates_presence_of :time_of_last_dose
  #  validates_presence_of :time_of_next_dose
  #  validates_presence_of :total_doses
  #  validates_presence_of :doses_remaining
  #  validates_presence_of :max_daily_doses
  #  validates_presence_of :dose
  #  validates_presence_of :user_instructions
  #  validates_presence_of :additional_instructions
  #  validates_presence_of :time_between_dose
  #  validates_presence_of :icon
  validates_presence_of :user_id
  belongs_to :user

  before_validation :set_doses_remaining, on: :create

  private
    def set_doses_remaining
      self.doses_remaining = self.total_doses
    end

end
