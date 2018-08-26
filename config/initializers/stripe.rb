# frozen_string_literal: true

Stripe.api_key = Rails.application.credentials.dig(Rails.env, :stripe, :secret_key)
