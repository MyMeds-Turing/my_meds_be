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
    argument :user_id, Integer

    type Types::RxType

    def resolve(attributes)
      rx = Prescription.where(id: attributes[:id]).first
      rx.update(attributes)
      rx
    end
  end
end
