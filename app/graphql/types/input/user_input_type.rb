# frozen_string_literal: true

module Types
  module Input
    class UserInputType < Types::BaseInputObject
      argument :first_name, String
      argument :last_name, String
      argument :email, String, required: true
      argument :password, String
      argument :password_confirmation, String
      argument :sms, String
      argument :notify, Integer
    end
  end
end
