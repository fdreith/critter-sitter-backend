# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_30_035747) do

  create_table "care_reminders", force: :cascade do |t|
    t.integer "pet_id", null: false
    t.string "care_type"
    t.string "details"
    t.datetime "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pet_id"], name: "index_care_reminders_on_pet_id"
  end

  create_table "events", force: :cascade do |t|
    t.integer "pet_id", null: false
    t.integer "user_id", null: false
    t.string "event_type"
    t.string "details"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pet_id"], name: "index_events_on_pet_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "households", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.integer "owner_id", null: false
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pets", force: :cascade do |t|
    t.string "name"
    t.string "care"
    t.integer "household_id"
    t.integer "owner_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "records", force: :cascade do |t|
    t.integer "pet_id", null: false
    t.string "record_type"
    t.string "details"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pet_id"], name: "index_records_on_pet_id"
  end

  create_table "user_households", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "household_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["household_id"], name: "index_user_households_on_household_id"
    t.index ["user_id"], name: "index_user_households_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "care_reminders", "pets"
  add_foreign_key "events", "pets"
  add_foreign_key "events", "users"
  add_foreign_key "records", "pets"
  add_foreign_key "user_households", "households"
  add_foreign_key "user_households", "users"
end
