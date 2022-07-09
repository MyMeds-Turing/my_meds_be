# frozen_string_literal: true

class Medication < ApplicationRecord
  validates :name, presence: true
  validates :dose, presence: true
  validates :time_between_dose, presence: true
end
