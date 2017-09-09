class CreateCalculationMeasurements < ActiveRecord::Migration[5.1]
    def change
        create_table :calculation_measurements do |t|

            t.references :calculation, index: true
            t.references :unit_of_measurement, index: true
            t.references :quantity, index: true

            t.decimal :value

            t.timestamps

        end
    end
end
