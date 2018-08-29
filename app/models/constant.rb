# frozen_string_literal: true

class Constant < ApplicationRecord
  before_save :evaluate_value

  extend FriendlyId
  include AlgoliaSearch
  include Value
  include Uniqueness
  friendly_id :name, use: :slugged
  translates :name
  acts_as_belongable

  algoliasearch do
    Settings.phylator.languages.each do |lang|
      add_attribute "name_#{lang}" do
        Globalize.with_locale(lang) { name }
      end
    end
    add_attribute :algolia_sym
  end
  def algolia_sym
    symbol.sub('<sub>', '').sub('</sub>', '').force_encoding('UTF-8')
  end

  cattr_accessor :set_value

  belongs_to :pack
  belongs_to :unit_of_measurement, optional: true
  belongable :calculations, 'Calculation'
  belongable :equations, 'Equation'

  validates :symbol, presence: true
  validates :name, presence: true

  scope :purchased, lambda do |user|
    includes(pack: :purchases)
      .where(packs: { purchases: { user_id: user&.id } })
  end
  scope :free, -> { includes(:pack).where(packs: { price: 0 }) }

  def sym
    symbol.html_safe
  end

  def pure_sym
    symbol.sub('<sub>', '_').sub('</sub>', '').force_encoding('UTF-8')
  end

  private

  def evaluate_value
    calculator = Dentaku::Calculator.new
    self.value = calculator.evaluate(set_value)
  end
end
