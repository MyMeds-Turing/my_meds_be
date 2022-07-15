# frozen_string_literal: true

module Types
  module Input
    class RxInputType < Types::BaseInputObject
      argument :id, ID, required: true
      argument :med_name, String
      argument :time_of_last_dose, GraphQL::Types::ISO8601DateTime
      argument :time_of_next_dose, GraphQL::Types::ISO8601DateTime
      argument :total_doses, Integer
      argument :doses_remaining, Integer
      argument :max_daily_doses, Integer
      argument :dose, String
      argument :user_instructions, String
      argument :additional_instructions, String
      argument :time_between_dose, Integer
      argument :icon, String
    end
  end
end
