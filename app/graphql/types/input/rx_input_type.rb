# frozen_string_literal: true

module Types
  module Input
    class RxInputType < Types::BaseInputObject
      argument :med_name, String, required: true
      argument :time_of_last_dose, GraphQL::Types::ISO8601DateTime, required: false
      argument :time_of_next_dose, GraphQL::Types::ISO8601DateTime, required: false
      argument :total_doses, Integer, required: false
      argument :doses_remaining, Integer, required: false
      argument :max_daily_doses, Integer, required: false
      argument :dose, String, required: false
      argument :user_instructions, String, required: false
      argument :additional_instructions, String, required: false
      argument :time_between_dose, Integer, required: false
      argument :icon, String, required: false
      argument :user_id, Integer, required: true
    end
  end
end
