class CreateCalculationConstants < ActiveRecord::Migration[5.1]
    def change
        create_table :calculation_constants do |t|

            t.references :calculation, index: true
            t.references :constant, index: true

            t.timestamps

        end
    end
end
