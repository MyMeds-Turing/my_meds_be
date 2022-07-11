module Mutations
  class AddNotification < Mutations::BaseMutation
    argument :params, Types::Input::NotificationInputType, required: true

    field :notification, Types::NotificationType, null: false

    def resolve(params:)
      notification_params = Hash params

      begin
        notification = Notification.create!(notification_params)

        { notification: notification }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
