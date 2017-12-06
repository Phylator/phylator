class CreateEquationQuantities < ActiveRecord::Migration[5.1]
    def change
        create_table :equation_quantities do |t|

            t.references :quantity, index: true
            t.references :equation, index: true

            t.timestamps

        end
    end
end
