class CreateCalculationEquations < ActiveRecord::Migration[5.1]
    def change
        create_table :calculation_equations do |t|

            t.references :calculation, index: true
            t.references :equation, index: true

            t.timestamps

        end
    end
end
