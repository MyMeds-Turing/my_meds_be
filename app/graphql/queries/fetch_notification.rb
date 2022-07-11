module Queries
  class FetchNotification < Queries::BaseQuery
    type Types::NotificationType, null: false
    argument :id, ID, required: true

    def resolve(id:)
      Notification.find(id)
    rescue ActiveRecord::RecordNotFound => _e
      GraphQL::ExecutionError.new('Notification does not exist.')
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
        " #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
