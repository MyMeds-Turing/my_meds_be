module Types
  module Input
    class NotificationInputType < Types::BaseInputObject
      argument :recipient, String, required: true
      argument :sent_at, GraphQL::Types::ISO8601DateTime, required: true
      argument :notification_type, String, required: true
    end
  end
end
