# frozen_string_literal: true

class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :notify, presence: true

  enum notify: { disabled: 0, email_only: 1, sms_only: 2, both: 3 }
  #  has_many :prescriptions
  #  has_many :medications, through: :prescription_medications
end
