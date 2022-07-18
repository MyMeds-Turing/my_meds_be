# frozen_string_literal: true

module Mutations
  class UpdateRx < Mutations::BaseMutation
    #    argument :params, Types::Input::RxInputType, required: true
    #    field :rx, Types::RxType, null: false

    #    def resolve(params:)
    #      rx_params = Hash params

    #      begin
    #        binding.pry
    #        rx = Prescription.find(rx_params.id).update(rx_params)

    #        { rx: rx }
    #      rescue ActiveRecord::RecordInvalid => e
    #        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
    #          " #{e.record.errors.full_messages.join(', ')}")
    #      end
    #    end

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
