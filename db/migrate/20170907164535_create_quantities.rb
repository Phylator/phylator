class CreateQuantities < ActiveRecord::Migration[5.1]
    def change
        create_table :quantities do |t|

            t.string :symbol, null: false, unique: true
            t.string :name, null: false, unique: true
            t.text :description, null: false

            t.timestamps

        end

        reversible do |dir|
            dir.up do
                Quantity.create_translation_table! name: { type: :string, null: false, unique: true }, description: { type: :text, null: false }
            end

            dir.down do
                Quantity.drop_translation_table!
            end
        end
    end
end
