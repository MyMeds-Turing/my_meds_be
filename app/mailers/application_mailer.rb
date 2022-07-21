# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'mymeds.turing@gmail.com'
  layout 'mailer'
end
