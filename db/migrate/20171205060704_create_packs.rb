class CreatePacks < ActiveRecord::Migration[5.1]
    def change
        create_table :packs do |t|

            t.references :category, index: true

            t.decimal :price, precision: 8, scale: 2

            t.string :slug, null: false, unique: true, index: true

            t.timestamps

        end

        reversible do |dir|
            dir.up do
                Pack.create_translation_table! name: { type: :string }, description: { type: :text }
            end

            dir.down do
                Pack.drop_translation_table!
            end
        end
    end
end
