class NativeMigration < ActiveRecord::Migration[5.1]
    def change
        create_table :native_apps do |t|

            t.references :owner, polymorphic: true, index: true

            t.string :platform, index: true
            t.string :url, index: true

            t.datetime :last_used

            t.timestamps

        end
    end
end
