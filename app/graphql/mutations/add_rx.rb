# frozen_string_literal: true

module Mutations
  class AddRx < Mutations::BaseMutation
    argument :params, Types::Input::RxInputType, required: true
    field :rx, Types::RxType, null: false

    def resolve(params:)
      prescription_params = Hash params

      begin
        rx = Prescription.create!(params)

        { rx: rx }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
