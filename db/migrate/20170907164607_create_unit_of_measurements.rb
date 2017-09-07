class CreateUnitOfMeasurements < ActiveRecord::Migration[5.1]
    def change
        create_table :unit_of_measurements do |t|

            t.references :quantity, index: true

            t.string :symbol, null: false, unique: true
            t.string :name, null: false, unique: true
            t.string :exchange_rate, null: false

            t.boolean :base, default: false, null: false

            t.timestamps

        end

        reversible do |dir|
            dir.up do
                UnitOfMeasurement.create_translation_table! name: { type: :string, null: false, unique: true }
            end

            dir.down do
                UnitOfMeasurement.drop_translation_table!
            end
        end
    end
end
