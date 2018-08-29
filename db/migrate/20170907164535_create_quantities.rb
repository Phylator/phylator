# frozen_string_literal: true

class CreateQuantities < ActiveRecord::Migration[5.1]
  def change
    create_table :quantities do |t|
      t.references :pack, index: true
      t.references :parent_quantity, index: true

      t.string :symbol, unique: true
      t.boolean :vector, default: false, null: false

      t.string :slug, null: false, unique: true, index: true

      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Quantity.create_translation_table! name: { type: :string },
                                           description: { type: :text },
                                           wikipedia: { type: :string }
      end

      dir.down do
        Quantity.drop_translation_table!
      end
    end
  end
end
