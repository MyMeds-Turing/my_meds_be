module Mutations
  class DeleteRx < Mutations::BaseMutation
    argument :id, ID, required: true
    type Types::RxType

    def resolve(id)
      rx = Prescription.find_by(id)
      rx.destroy
    end
  end
end
    # TODO: define return fields
    # field :post, Types::PostType, null: false

    # TODO: define arguments
    # argument :name, String, required: true

    # TODO: define resolve method
    # def resolve(name:)
    #   { post: ... }
    # end
