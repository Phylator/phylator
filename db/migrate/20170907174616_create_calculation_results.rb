class CreateCalculationResults < ActiveRecord::Migration[5.1]
    def change
        create_table :calculation_results do |t|

            t.references :calculation, index: true

            t.text :value

            t.timestamps

        end
    end
end
