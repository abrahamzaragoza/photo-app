# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :port           => '587',
  :address        => 'smtp.mailgun.org',
  :user_name      => ENV['MAILGUN_USERNAME'],
  :password       => ENV['MAILGUN_PASSWORD'],
  :domain         => 'https://btt-photo-app-z.herokuapp.com/',
  :authentication => :plain,
}
ActionMailer::Base.delivery_method = :smtp
