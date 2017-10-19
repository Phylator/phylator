class CreateUnitOfMeasurements < ActiveRecord::Migration[5.1]
    def change
        create_table :unit_of_measurements do |t|

            t.string :symbol
            t.boolean :base, default: false, null: false
            t.string :to_base, default: '*1', null: false

            t.timestamps

        end

        reversible do |dir|
            dir.up do
                UnitOfMeasurement.create_translation_table! name: { type: :string }
            end

            dir.down do
                UnitOfMeasurement.drop_translation_table!
            end
        end
    end
end
