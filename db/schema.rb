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

ActiveRecord::Schema[8.0].define(version: 2024_10_14_021008) do
  create_table "active_analytics_views_per_days", force: :cascade do |t|
    t.string "site", null: false
    t.string "page", null: false
    t.date "date", null: false
    t.bigint "total", default: 1, null: false
    t.string "referrer_host"
    t.string "referrer_path"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["date"], name: "index_active_analytics_views_per_days_on_date"
    t.index ["referrer_host", "referrer_path", "date"], name: "index_active_analytics_views_per_days_on_referrer_and_date"
    t.index ["site", "page", "date"], name: "index_active_analytics_views_per_days_on_site_and_date"
  end

  create_table "cooking_records", force: :cascade do |t|
    t.datetime "finished_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meals", force: :cascade do |t|
    t.integer "diner_id", null: false
    t.integer "cooking_id", null: false
    t.integer "egg_count", null: false
    t.integer "corn_count", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sweet_potato_count", default: 0, null: false
    t.index ["cooking_id"], name: "index_meals_on_cooking_id"
    t.index ["diner_id"], name: "index_meals_on_diner_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.integer "egg_count", null: false
    t.integer "corn_count", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sweet_potato_count", default: 0, null: false
  end

  add_foreign_key "meals", "cooking_records", column: "cooking_id"
  add_foreign_key "meals", "users", column: "diner_id"
end
