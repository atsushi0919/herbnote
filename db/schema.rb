ActiveRecord::Schema.define(version: 2021_05_24_003946) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "herbs", force: :cascade do |t|
    t.string "name", null: false
    t.string "alies"
    t.integer "plant_type", default: 0, null: false
    t.string "image", default: "noimage.png", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end
end
