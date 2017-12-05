Rails.configuration.stripe = {
    publishable_key: Settings.stripe.publishable_key,
    secret_key: Settings.stripe.secret_key
}

Stripe.api_key = Settings.stripe.secret_key
