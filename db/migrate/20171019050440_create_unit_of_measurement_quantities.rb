class CreateUnitOfMeasurementQuantities < ActiveRecord::Migration[5.1]
    def change
        create_table :unit_of_measurement_quantities do |t|

            t.references :quantity, index: true
            t.references :unit_of_measurement, index: true

            t.timestamps

        end
    end
end
