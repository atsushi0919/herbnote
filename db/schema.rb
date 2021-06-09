# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_06_09_065612) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "herb_descriptions", force: :cascade do |t|
    t.integer "herb_id", null: false
    t.text "overview"
    t.text "how_to_use"
    t.text "how_to_grow"
    t.text "note"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "herb_properties", force: :cascade do |t|
    t.string "feature", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "herb_property_relations", force: :cascade do |t|
    t.integer "herb_id", null: false
    t.integer "herb_property_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["herb_id", "herb_property_id"], name: "index_herb_property_relations_on_herb_id_and_herb_property_id", unique: true
  end

  create_table "herbs", force: :cascade do |t|
    t.string "name", null: false
    t.string "alies"
    t.integer "classification", default: 0, null: false
    t.string "image", default: "noimage.jpg", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
