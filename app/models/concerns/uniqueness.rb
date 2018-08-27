# frozen_string_literal: true

module Uniqueness
  extend ActiveSupport::Concern

  included do
    validate :uniqueness_of_record
  end

  private

  def uniqueness_of_record
    return unless symbol_changed?
    return unless Quantity.where(symbol: symbol).any? ||
                  Constant.where(symbol: symbol).any?

    errors.add(:symbol, 'has already been taken')
  end
end
