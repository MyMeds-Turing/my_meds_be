# frozen_string_literal: true

module Queries
  class FetchRxs < Queries::BaseQuery
    type [Types::RxType],
         null: false

    def resolve
      Prescription.all
    end
  end
end
