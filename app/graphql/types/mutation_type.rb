# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :add_notification, mutation: Mutations::AddNotification
    field :add_rx, mutation: Mutations::AddRx
  end
end
