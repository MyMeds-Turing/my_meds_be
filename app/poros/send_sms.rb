# frozen_string_literal: true

class SendSMS
  def initialize
    @twilio_client = Twilio::REST::Client.new((ENV['TWILIO_SID']).to_s, (ENV['TWILIO_TOKEN']).to_s)
  end

  def send(_sms, med)
    @twilio_client.messages.create(
      from: "+1#{ENV['TWILIO_PHONE_NUMBER']}",
      to: "+1#{ENV['TEST_PHONE_NUMBER']}",
      body: "Its time to take your #{med}"
    )
  end
end
