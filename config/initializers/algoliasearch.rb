# frozen_string_literal: true

AlgoliaSearch.configuration = {
  application_id: Rails.application.credentials.dig(Rails.env, :algoliasearch, :application_id),
  api_key: Rails.application.credentials.dig(Rails.env, :algoliasearch, :api_key)
}
