# frozen_string_literal: true

class Equation < ApplicationRecord
  after_create :associate

  acts_as_belonger
  acts_as_belongable
  serialize :conditions, Array
  translates :title, :conditions
  translation_class.send :serialize, :conditions

  belonger :quantities, 'Quantity'
  belonger :constants, 'Constant'

  belongs_to :quantity
  belongable :calculations, 'Calculation', scope: :dependency
  belongable :excluded_from_calculations, 'Calculation', scope: :exclude

  validates :equation, presence: true

  scope :free, -> { includes(quantity: :pack).where(quantities: { packs: { price: 0 } }) }

  def pure_equation
    equation.tr("'", '')
  end

  private

  def associate
    calculator = ::Dentaku::Calculator.new(case_sensitive: true)
    symbols = calculator.dependencies(pure_equation)
    Quantity.all.each do |quantity|
      add_belongable!(quantity) if symbols.include?(quantity.pure_sym)
    end
    Constant.all.each do |constant|
      add_belongable!(constant) if symbols.include?(constant.pure_sym)
    end
  end
end
