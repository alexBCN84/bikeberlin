##This initializer configures the Stripe gem to use API Keys

if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
    :secret_key => ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    :publishable_key => 'pk_test_Smag3RRKe90d8cQOir7a5TS5',
    :secret_key => 'sk_test_zHovanIYx62YfHrYsInhxkoX'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]