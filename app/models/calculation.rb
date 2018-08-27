# frozen_string_literal: true

class Calculation < ApplicationRecord
  before_validation :calculate, on: :create
  before_validation :recalculate, on: :update

  include Value
  include AlgoliaSearch
  acts_as_belonger

  algoliasearch do
    attribute :name, :description
    add_attribute :algolia_quantity
  end
  def algolia_quantity
    quantity.name
  end

  has_many :measurements, class_name: 'Calculation::Measurement'
  belonger :equations, 'Equation', scope: :dependency
  belonger :missing_equations, 'Equation', scope: :missing
  belonger :constants, 'Constant', scope: :dependency

  belongs_to :unit_of_measurement
  belongs_to :quantity
  belongs_to :user, optional: true

  validates :measurements, presence: true

  accepts_nested_attributes_for :measurements,
                                reject_if: ->(a) { a[:value].blank? },
                                allow_destroy: true

  def undefined?
    value.nil?
  end

  def calculate!
    update!(value: Calculate.new(calculation: calculation))
  end

  private

  def calculate
    self.value = Calculate.new(calculation: calculation)
  end

  def recalculate
    calculate if unit_of_measurement_id_changed?
  end
end
