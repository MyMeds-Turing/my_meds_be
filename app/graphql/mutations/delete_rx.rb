# frozen_string_literal: true

module Mutations
  class DeleteRx < Mutations::BaseMutation
    argument :id, ID, required: true
    type Types::RxType

    def resolve(id)
      rx = Prescription.find_by(id)
      rx&.destroy
    end
  end
end
