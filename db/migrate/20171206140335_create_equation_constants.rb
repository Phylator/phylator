class CreateEquationConstants < ActiveRecord::Migration[5.1]
    def change
        create_table :equation_constants do |t|

            t.references :constant, index: true
            t.references :equation, index: true

            t.timestamps

        end
    end
end
