Rails.configuration.stripe = {
  :publishable_key => ENV['STRIPE_TEST_PUBLISHABLE_KEY'],
  :secret_key => ENV['STRIPE_TEST_SECRET_KEY']
}

Stripe.api_key = Rails.application.credentials.stripe[:secret_test_key]
