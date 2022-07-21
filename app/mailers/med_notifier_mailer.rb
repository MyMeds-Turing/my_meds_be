class MedNotifierMailer < ApplicationMailer
  def inform(info, recipient)
    @user = info[:user]
    @message = info[:message]
    @med_name = info[:med_name]
    @time_of_last_dose = info[:time_of_last_dose]

    mail(
      to: recipient,
      subject: "Hello #{@user.name}, You took #{@med_name} at #{@time_of_last_dose}"
    )
  end
end
