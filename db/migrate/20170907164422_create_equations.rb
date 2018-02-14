class CreateEquations < ActiveRecord::Migration[5.1]
    def change
        create_table :equations do |t|

            t.references :quantity, index: true

            t.text :equation

            t.timestamps

        end

        reversible do |dir|
            dir.up do
                Equation.create_translation_table! title: { type: :string }, conditions: { type: :text }
            end

            dir.down do
                Equation.drop_translation_table!
            end
        end
    end
end
