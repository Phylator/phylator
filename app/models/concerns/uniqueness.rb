# frozen_string_literal: true

module Uniqueness
  extend ActiveSupport::Concern

  included do
    validate :uniqueness_of_record
  end

  private

  def uniqueness_of_record
    if symbol_changed?
      if Rails.env == 'production'
        if Quantity.where(symbol: symbol).any? || Constant.where(symbol: symbol).any?
          errors.add(:symbol, 'has already been taken')
        end
      else
        if Quantity.where('BINARY symbol = ?', symbol).any? || Constant.where('BINARY symbol = ?', symbol).any?
          errors.add(:symbol, 'has already been taken')
        end
      end
    end
  end
end
