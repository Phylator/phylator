# frozen_string_literal: true

class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :slug, null: false, unique: true, index: true

      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Category.create_translation_table! name: { type: :string },
                                           description: { type: :text }
      end

      dir.down do
        Category.drop_translation_table!
      end
    end
  end
end
