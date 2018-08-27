# frozen_string_literal: true

class CreateCalculations < ActiveRecord::Migration[5.1]
  def change
    create_table :calculations do |t|
      t.references :quantity, index: true
      t.references :unit_of_measurement, index: true
      t.references :user, index: true

      t.string :name
      t.text :description

      t.text :value

      t.timestamps
    end
  end
end
