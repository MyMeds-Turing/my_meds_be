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

        attributes[:doses_remaining] = if rx.doses_remaining >= 1
                                         rx.doses_remaining - 1
                                       else
                                         0
                                       end

        rx.update(attributes)
        send_notification(rx)
        rx

      end
    end

    def send_notification(rx)
      user = User.find(rx.user_id)
      recipient = user.email
      info = {
        med_name: rx.med_name,
        time_of_last_dose: rx.time_of_last_dose,
        message: "Please visit https://mymeds-turing.github.io/my_meds_fe/ for more details",
        name: user.first_name,
        id: rx.id
      }
      case user.notify
      when 'disabled'
        nil
      when 'email_only'
        MedNotifierMailer.inform(info, recipient).deliver_now
        #MedReminderMailer.inform(info, recipient).deliver_later!(wait: rx.time_between_dose.minutes)
        MedReminderMailer.inform(info, recipient).deliver_now
      when 'sms_only'
      #        SendSmsJob.set(wait: rx.time_between_dose.minutes).perform_later(user.sms, rx.med_name)
      when 'both'
        MedNotifierMailer.inform(info, recipient).deliver_now
#        MedReminderMailer.inform(info, recipient).deliver_later(wait: rx.time_between_dose.minutes)
        MedReminderMailer.inform(info, recipient).deliver_now
        #SendSmsJob.set(wait: rx.time_between_dose.minute).perform_later(user.sms, rx.med_name)
        SendSmsJob.set(wait: 1.minute).perform_later(user.sms, rx.med_name)
      end
    end
  end
end
