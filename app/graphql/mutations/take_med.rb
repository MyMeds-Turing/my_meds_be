# frozen_string_literal: true

module Mutations
  class TakeMed < Mutations::BaseMutation
    argument :id, ID, required: true

    type Types::RxType

    def resolve(attributes)
      rx = Prescription.where(id: attributes[:id]).first
      unless rx.nil?
        time = Time.now
        attributes[:time_of_last_dose] = time
        attributes[:time_of_next_dose] = time + rx.time_between_dose.minutes
        attributes[:doses_remaining] = rx.doses_remaining - 1
        rx.update(attributes)
        binding.pry
        rx
      end
      # call the mailer
      # call the sms
      # Notification.create .....
    end
  end
end
