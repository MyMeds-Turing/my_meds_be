module Mutations
  class DeleteRx < Mutations::BaseMutation
    argument :id, ID, required: true
    type Types::RxType

    def resolve(id:)
      Prescription.find(id)
    rescue ActiveRecord::RecordNotFound => _e
      GraphQL::ExecutionError.new('RX does not exist.')
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
        " #{e.record.errors.full_messages.join(', ')}")
      rx.destroy if rx
    end
  end
end
