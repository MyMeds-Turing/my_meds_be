# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :add_notification, mutation: Mutations::AddNotification
  end
end
