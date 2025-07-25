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

ActiveRecord::Schema[8.0].define(version: 2025_07_23_220328) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "inspectors", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "specialty"
  end

  create_table "inspectors_mosquito_traps", id: false, force: :cascade do |t|
    t.bigint "inspector_id", null: false
    t.bigint "mosquito_trap_id", null: false
  end

  create_table "mosquito_readings", force: :cascade do |t|
    t.bigint "mosquito_trap_id", null: false
    t.date "date"
    t.integer "count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "species"
    t.index ["mosquito_trap_id"], name: "index_mosquito_readings_on_mosquito_trap_id"
  end

  create_table "mosquito_traps", force: :cascade do |t|
    t.string "trap_id"
    t.string "name"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "mosquito_readings", "mosquito_traps"
end
