# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :port           => '587',
  :address        => 'smtp.mailgun.org',
  :user_name      => 'postmaster@sandboxfde4401441954138ad501881d1fdfacf.mailgun.org',
  :password       => '5f18672cb38dc21f964b3aae7ad29e1c-07e2c238-5615a6a5',
  :domain         => 'https://btt-photo-app-z.herokuapp.com/',
  :authentication => :plain,
}
ActionMailer::Base.delivery_method = :smtp
