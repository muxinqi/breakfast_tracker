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

ActiveRecord::Schema[7.1].define(version: 2023_10_15_144016) do
  create_table "cooking_records", force: :cascade do |t|
    t.integer "operator_id", null: false
    t.integer "terminator_id"
    t.datetime "finished_at"
    t.integer "egg_count", null: false
    t.integer "corn_count", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["operator_id"], name: "index_cooking_records_on_operator_id"
    t.index ["terminator_id"], name: "index_cooking_records_on_terminator_id"
  end

  create_table "meals", force: :cascade do |t|
    t.integer "diner_id", null: false
    t.integer "cooking_id", null: false
    t.integer "egg_count", null: false
    t.integer "corn_count", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cooking_id"], name: "index_meals_on_cooking_id"
    t.index ["diner_id"], name: "index_meals_on_diner_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.integer "egg_count", null: false
    t.integer "corn_count", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "cooking_records", "users", column: "operator_id"
  add_foreign_key "cooking_records", "users", column: "terminator_id"
  add_foreign_key "meals", "cooking_records", column: "cooking_id"
  add_foreign_key "meals", "users", column: "diner_id"
end
