# frozen_string_literal: true

class MedReminderMailer < ApplicationMailer
  def inform(info, recipient)
    @message = info[:message]
    @med_name = info[:med_name]
    @time_of_last_dose = info[:time_of_last_dose]
    @name = info[:name]

    mail(
      to: recipient,
      subject: "Hello #{@name}, it is time to take your #{@med_name}"
    )
  end
end
