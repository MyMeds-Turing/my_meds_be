# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :delete_rx, mutation: Mutations::DeleteRx
    field :add_notification, mutation: Mutations::AddNotification
    field :add_rx, mutation: Mutations::AddRx
    field :update_rx, mutation: Mutations::UpdateRx
    field :take_med, mutation: Mutations::TakeMed
    field :add_user, mutation: Mutations::AddUser
  end
end
