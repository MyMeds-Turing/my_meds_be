# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :fetch_notifications, resolver: Queries::FetchNotifications
    field :fetch_notification, resolver: Queries::FetchNotification
    field :fetch_rxs, resolver: Queries::FetchRxs
    field :fetch_user, resolver: Queries::FetchUser
    field :fetch_user_rxs, resolver: Queries::FetchUserRxs

  end
end
