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

ActiveRecord::Schema.define(version: 2022_07_10_163021) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "medications", force: :cascade do |t|
    t.string "name"
    t.string "dose"
    t.integer "time_between_dose"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prescriptions", force: :cascade do |t|
    t.string "med_name"
    t.datetime "time_of_last_dose"
    t.datetime "time_of_next_dose"
    t.integer "total_doses"
    t.integer "doses_remaining"
    t.integer "max_daily_doses"
    t.text "instructions"
    t.integer "time_between_dose"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_prescriptions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "sms"
    t.integer "notify", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "prescriptions", "users"
end
