class CreateCalculationDependencies < ActiveRecord::Migration[5.1]
    def change
        create_table :calculation_dependencies do |t|

            t.references :calculation, index: true
            t.references :quantity, index: true

            t.integer :index, null: false

            t.timestamps

        end
    end
end
