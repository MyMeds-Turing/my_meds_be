# frozen_string_literal: true

module Queries
  class FetchUserRxs < Queries::BaseQuery
    type [Types::RxType], null: false
    argument :id, ID, required: true

    def resolve(id:)
      Prescription.where('user_id = ?', id)
    rescue ActiveRecord::RecordNotFound => _e
      GraphQL::ExecutionError.new('Rx does not exist.')
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
        " #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
