# frozen_string_literal: true

environment = Rails.env.production? ? :production : :development
application_id = Rails.application.credentials.dig(
  environment, :algoliasearch, :application_id
)
api_key =
  Rails.application.credentials.dig(environment, :algoliasearch, :api_key)

AlgoliaSearch.configuration = {
  application_id: application_id,
  api_key: api_key
}
