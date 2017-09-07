class CreateCalculations < ActiveRecord::Migration[5.1]
    def change
        create_table :calculations do |t|

            t.references :user, index: true

            t.string :name
            t.boolean :public, default: true, null: false

            t.timestamps

        end
    end
end
