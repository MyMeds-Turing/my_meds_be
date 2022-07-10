# frozen_string_literal: true

class Prescription < ApplicationRecord
  validates_presence_of :med_name
  validates_uniqueness_of :med_name
  validates_presence_of :time_of_last_dose
  validates_presence_of :time_of_next_dose
  validates_presence_of :total_doses
  validates_presence_of :doses_remaining
  validates_presence_of :max_daily_doses
  validates_presence_of :instructions
  validates_presence_of :time_between_dose
  belongs_to :user
end
