# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :add_notification, mutation: Mutations::AddNotification
    field :update_rx, mutation: Mutations::UpdateRx
  end
end
