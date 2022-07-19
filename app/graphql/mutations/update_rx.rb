# frozen_string_literal: true

module Mutations
  class UpdateRx < Mutations::BaseMutation
    argument :id, ID, required: true
    argument :med_name, String, required: false
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
    argument :user_id, Integer, required: false

    type Types::RxType

    def resolve(attributes)
      rx = Prescription.where(id: attributes[:id]).first
      rx.update(attributes)
      rx
    end
  end
end
