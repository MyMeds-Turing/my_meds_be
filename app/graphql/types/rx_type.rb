# frozen_string_literal: true

module Types
  class RxType < Types::BaseObject
    field :id, ID, null: false
    field :med_name, String
    field :time_of_last_dose, GraphQL::Types::ISO8601DateTime
    field :time_of_next_dose, GraphQL::Types::ISO8601DateTime
    field :total_doses, Integer
    field :doses_remaining, Integer
    field :max_daily_doses, Integer
    field :dose, String
    field :user_instructions, String
    field :additional_instructions, String
    field :time_between_dose, Integer
    field :icon, String
    field :user_id, Integer
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

def time_of_next_dose
  object.
end

  end
end
