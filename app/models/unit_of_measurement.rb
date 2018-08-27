# frozen_string_literal: true

class UnitOfMeasurement < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  translates :name
  acts_as_belonger
  acts_as_belongable

  has_many :calculations
  has_many :constants
  has_many :measurements, class_name: 'Calculation::Measurement'
  belongable :quantities, 'Quantity'

  belongs_to :si, class_name: 'UnitOfMeasurement', optional: true
  has_many :si_prefixes, class_name: 'UnitOfMeasurement', foreign_key: :si

  validates :symbol, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true
  validates :to_base, presence: true

  scope :base, -> { where(si_id: nil) }

  def sym
    symbol.html_safe
  end

  def base?
    base
  end

  def from_base
    f_base || to_base.tr('*/', '/*')
  end
end
