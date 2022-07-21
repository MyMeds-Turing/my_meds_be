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

        if rx.doses_remaining >= 1
          attributes[:doses_remaining] = rx.doses_remaining - 1
        else
          attributes[:doses_remaining] = 0
        end

        rx.update(attributes)
        rx
        user = User.find(rx.user_id)
        recipient = user.email
        mailer = MedNotifierMailer.new
        info = {
          med_name: rx.med_name,
          time_of_last_dose: rx.time_of_last_dose,
          message: 'visit https://mymeds-turing.github.io/my_meds_fe/ to see more'
        }
        mailer.inform(info)
      end
      # call the mailer
      # call the sms
      # Notification.create .....
    end
  end
end
