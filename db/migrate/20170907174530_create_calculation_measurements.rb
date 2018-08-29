# frozen_string_literal: true

class CreateCalculationMeasurements < ActiveRecord::Migration[5.1]
  def change
    create_table :calculation_measurements do |t|
      t.references :calculation, index: true
      t.references :unit_of_measurement, index: true
      t.references :quantity, index: true

      t.text :value
      t.text :margin_of_error

      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
