class CreateConstants < ActiveRecord::Migration[5.1]
    def change
        create_table :constants do |t|

            t.references :unit_of_measurement, index: true

            t.string :symbol, unique: true
            t.text :value, null: false

            t.string :slug, null: false, unique: true, index: true

            t.timestamps

        end

        reversible do |dir|
            dir.up do
                Constant.create_translation_table! name: { type: :string }, description: { type: :text }
            end

            dir.down do
                Constant.drop_translation_table!
            end
        end
    end
end
