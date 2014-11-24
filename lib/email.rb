require 'rest_client'

class Email

  MAILGUN_API_KEY = ENV['MAILGUN_API_KEY']

  def initialize(email, message)
    RestClient.post "https://api:#{MAILGUN_API_KEY}"\
    "@api.mailgun.net/v2/app31919266.mailgun.org/messages",
    :from => "Chitter <users@#chitter.co>",
    :to => "#{email}",
    :subject => "Reset Password",
    :text => "#{message}"
  end

  def self.password_reset(email, token)
    link = "http://#{ENV['SITE_ADDRESS']}/users/password/reset/#{token}"
    message = "Hi there, to reset your password, please click here: #{link}. Thanks! Chitter"
    new(email, message)
  end

end
