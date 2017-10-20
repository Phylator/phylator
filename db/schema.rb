# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171020201807) do

  create_table "ahoy_events", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "visit_id"
    t.bigint "user_id"
    t.string "name"
    t.text "properties"
    t.timestamp "time"
    t.index ["name", "time"], name: "index_ahoy_events_on_name_and_time"
    t.index ["user_id", "name"], name: "index_ahoy_events_on_user_id_and_name"
    t.index ["visit_id", "name"], name: "index_ahoy_events_on_visit_id_and_name"
  end

  create_table "calculation_constants", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "calculation_id"
    t.bigint "constant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["calculation_id"], name: "index_calculation_constants_on_calculation_id"
    t.index ["constant_id"], name: "index_calculation_constants_on_constant_id"
  end

  create_table "calculation_equations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "calculation_id"
    t.bigint "equation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["calculation_id"], name: "index_calculation_equations_on_calculation_id"
    t.index ["equation_id"], name: "index_calculation_equations_on_equation_id"
  end

  create_table "calculation_measurements", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "calculation_id"
    t.bigint "unit_of_measurement_id"
    t.bigint "quantity_id"
    t.text "value"
    t.text "margin_of_error"
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["calculation_id"], name: "index_calculation_measurements_on_calculation_id"
    t.index ["quantity_id"], name: "index_calculation_measurements_on_quantity_id"
    t.index ["unit_of_measurement_id"], name: "index_calculation_measurements_on_unit_of_measurement_id"
  end

  create_table "calculation_results", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "calculation_id"
    t.text "value"
    t.text "margin_of_error"
    t.boolean "undefined", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["calculation_id"], name: "index_calculation_results_on_calculation_id"
  end

  create_table "calculations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "quantity_id"
    t.bigint "unit_of_measurement_id"
    t.bigint "user_id"
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quantity_id"], name: "index_calculations_on_quantity_id"
    t.index ["unit_of_measurement_id"], name: "index_calculations_on_unit_of_measurement_id"
    t.index ["user_id"], name: "index_calculations_on_user_id"
  end

  create_table "constant_translations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "constant_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["constant_id"], name: "index_constant_translations_on_constant_id"
    t.index ["locale"], name: "index_constant_translations_on_locale"
  end

  create_table "constants", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "unit_of_measurement_id"
    t.string "symbol"
    t.text "value", null: false
    t.string "slug", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_constants_on_slug"
    t.index ["unit_of_measurement_id"], name: "index_constants_on_unit_of_measurement_id"
  end

  create_table "equation_quantities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "equation_id"
    t.bigint "quantity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["equation_id"], name: "index_equation_quantities_on_equation_id"
    t.index ["quantity_id"], name: "index_equation_quantities_on_quantity_id"
  end

  create_table "equations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "quantity_id"
    t.text "equation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quantity_id"], name: "index_equations_on_quantity_id"
  end

  create_table "friendly_id_slugs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, length: { slug: 70, scope: 70 }
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", length: { slug: 140 }
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "quantities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "symbol"
    t.boolean "vector", default: false, null: false
    t.string "slug", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_quantities_on_slug"
  end

  create_table "quantity_translations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "quantity_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.text "description"
    t.index ["locale"], name: "index_quantity_translations_on_locale"
    t.index ["quantity_id"], name: "index_quantity_translations_on_quantity_id"
  end

  create_table "taggings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "tag_id"
    t.string "taggable_type"
    t.bigint "taggable_id"
    t.string "tagger_type"
    t.bigint "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
  end

  create_table "tags", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", collation: "utf8_bin"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "unit_of_measurement_quantities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "quantity_id"
    t.bigint "unit_of_measurement_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quantity_id"], name: "index_unit_of_measurement_quantities_on_quantity_id"
    t.index ["unit_of_measurement_id"], name: "index_unit_of_measurement_quantities_on_unit_of_measurement_id"
  end

  create_table "unit_of_measurement_translations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "unit_of_measurement_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["locale"], name: "index_unit_of_measurement_translations_on_locale"
    t.index ["unit_of_measurement_id"], name: "index_f259fbc27d7e027653a37aa7f9212acb0d54a1ef"
  end

  create_table "unit_of_measurements", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "symbol"
    t.boolean "base", default: false, null: false
    t.string "to_base", default: "*1", null: false
    t.string "f_base"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "locale", default: "en", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "visits", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "visit_token"
    t.string "visitor_token"
    t.string "ip"
    t.text "user_agent"
    t.text "referrer"
    t.text "landing_page"
    t.bigint "user_id"
    t.string "referring_domain"
    t.string "search_keyword"
    t.string "browser"
    t.string "os"
    t.string "device_type"
    t.integer "screen_height"
    t.integer "screen_width"
    t.string "country"
    t.string "region"
    t.string "city"
    t.string "postal_code"
    t.decimal "latitude", precision: 10
    t.decimal "longitude", precision: 10
    t.string "utm_source"
    t.string "utm_medium"
    t.string "utm_term"
    t.string "utm_content"
    t.string "utm_campaign"
    t.timestamp "started_at"
    t.index ["user_id"], name: "index_visits_on_user_id"
    t.index ["visit_token"], name: "index_visits_on_visit_token", unique: true
  end

end
