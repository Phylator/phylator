# frozen_string_literal: true

class Calculation::Measurement < ApplicationRecord
  self.table_name = 'calculation_measurements'

  include Value

  before_save :re_calc, on: :update

  belongs_to :calculation, class_name: '::Calculation'
  belongs_to :unit_of_measurement, class_name: '::UnitOfMeasurement'
  belongs_to :quantity, class_name: '::Quantity'

  validates :value, presence: true

  private

  def re_calc
    calculation.calc if value_changed? || margin_of_error_changed?
  end
end
