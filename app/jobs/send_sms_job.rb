class SendSmsJob < ApplicationJob
  queue_as :default

#  def perform(*args)
  def perform
    puts "Test of sms job"
    # Do something later
  end

  before_perform :print_b4_msg
  after_perform :print_after_msg

  def print_b4_msg
    puts "Inside b4 block"
  end

  def print_after_msg
    puts "Inside after block"
  end
end
