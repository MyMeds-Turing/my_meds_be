# frozen_string_literal: true

module Types
  class NotificationType < Types::BaseObject
    field :id, ID, null: false
    field :recipient, String
    field :sent_at, GraphQL::Types::ISO8601DateTime
    field :type, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :recipient, String, null: false
    field :sent_at, GraphQL::Types::ISO8601DateTime, null: false
    field :type, String, null: false
  end
end
