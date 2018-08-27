# frozen_string_literal: true

class Quantity < ApplicationRecord
  extend FriendlyId
  include AlgoliaSearch
  include Uniqueness
  friendly_id :name, use: :slugged
  translates :name, :description, :wikipedia
  acts_as_belonger
  acts_as_belongable

  algoliasearch do
    Settings.phylator.languages.each do |lang|
      add_attribute "name_#{lang}" do
        Globalize.with_locale(lang) { name }
      end
      add_attribute "description_#{lang}" do
        Globalize.with_locale(lang) { description }
      end
    end
    add_attribute :algolia_sym
  end
  def algolia_sym
    symbol.sub('<sub>', '').sub('</sub>', '').force_encoding('UTF-8')
  end

  has_many :equations
  has_many :calculations
  has_many :measurements, class_name: 'Calculation::Measurement'
  belonger :unit_of_measurements, 'UnitOfMeasurement'

  belongs_to :pack
  belongable :in_equations, 'Equation'

  belongs_to :parent_quantity, class_name: 'Quantity', foreign_key: 'parent_quantity_id', required: false
  has_many :child_quantities, class_name: 'Quantity', foreign_key: 'parent_quantity_id'

  validates :symbol, presence: true
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true

  scope :base, -> { where(parent_quantity: nil) }
  scope :free, -> { includes(:pack).where(packs: { price: 0 }) }

  def sym
    symbol.html_safe
  end
  def pure_sym
    symbol.sub('<sub>', '_').sub('</sub>', '').force_encoding('UTF-8')
  end
  def ascii_sym
    symbol.sub('<sub>', '_"').sub('</sub>', '"').force_encoding('UTF-8')
  end
end
