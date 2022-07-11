module Types
  module Input
    class NotificationInputType < Types::BaseInputObject
      argument :recipient, String, required: true
      argument :sent_at, Datetime, required: true
      argument :type, String, required: true
    end
  end
end
