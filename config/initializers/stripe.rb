# frozen_string_literal: true

environment = Rails.env.production? ? :production : :development

Stripe.api_key =
  Rails.application.credentials.dig(environment, :stripe, :secret_key)
