# frozen_string_literal: true

# app/models/prescription.rb
class Prescription < ApplicationRecord
  validates_presence_of :med_name
  validates_uniqueness_of :med_name
  validates_presence_of :time_of_last_dose
  validates_presence_of :time_of_next_dose
  validates_presence_of :total_doses
  validates_presence_of :doses_remaining
  validates_presence_of :max_daily_doses
  validates_presence_of :dose
  validates_presence_of :user_instructions
  validates_presence_of :additional_instructions
  validates_presence_of :time_between_dose
  validates_presence_of :icon

  belongs_to :user
end
