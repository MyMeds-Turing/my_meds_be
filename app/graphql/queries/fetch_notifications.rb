# frozen_string_literal: true

module Queries
  class FetchNotifications < Queries::BaseQuery
    type [Types::NotificationType], null: false

    def resolve
      Notification.all.order(created_at: :desc)
    end
  end
end
