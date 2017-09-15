class CreateEquations < ActiveRecord::Migration[5.1]
    def change
        create_table :equations do |t|

            t.references :quantity, index: true

            t.text :equation

            t.timestamps

        end
    end
end
