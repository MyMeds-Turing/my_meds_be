# frozen_string_literal: true

class MedNotifierMailer < ApplicationMailer
  def inform(info, recipient)
    @message = info[:message]
    @med_name = info[:med_name]
    @time_of_last_dose = info[:time_of_last_dose]
    @name = info[:name]

    mail(
      to: recipient,
      subject: "Hello #{@name}, You took #{@med_name} at #{@time_of_last_dose.strftime "%m/%d/%Y %H:%M"}"
    )
  end
end
