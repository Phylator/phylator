class CreatePurchases < ActiveRecord::Migration[5.1]
    def change
        create_table :purchases do |t|

            t.references :user, index: true
            t.references :pack, index: true

            t.decimal :amount, precision: 8, scale: 2

            t.string :stripe_charge_id
            t.boolean :completed, default: false, null: false

            t.timestamps

        end
    end
end
