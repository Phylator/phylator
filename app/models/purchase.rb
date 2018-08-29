# frozen_string_literal: true

class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :pack

  validates :amount, presence: true, numericality: true
end
