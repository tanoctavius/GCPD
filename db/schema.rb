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

ActiveRecord::Schema[7.0].define(version: 2023_05_20_194902) do
  create_table "assignments", force: :cascade do |t|
    t.integer "investigation_id"
    t.integer "officer_id"
    t.date "start_date"
    t.date "end_date"
    t.index ["investigation_id"], name: "index_assignments_on_investigation_id"
    t.index ["officer_id"], name: "index_assignments_on_officer_id"
  end

  create_table "crime_investigations", force: :cascade do |t|
    t.integer "crime_id"
    t.integer "investigation_id"
    t.index ["crime_id"], name: "index_crime_investigations_on_crime_id"
    t.index ["investigation_id"], name: "index_crime_investigations_on_investigation_id"
  end

  create_table "crimes", force: :cascade do |t|
    t.string "name"
    t.boolean "felony"
    t.boolean "active", default: true
  end

  create_table "criminals", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "aka"
    t.boolean "convicted_felon"
    t.boolean "enhanced_powers"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "investigation_notes", force: :cascade do |t|
    t.integer "investigation_id"
    t.integer "officer_id"
    t.text "content"
    t.date "date"
    t.index ["investigation_id"], name: "index_investigation_notes_on_investigation_id"
    t.index ["officer_id"], name: "index_investigation_notes_on_officer_id"
  end

  create_table "investigations", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "crime_location"
    t.date "date_opened"
    t.date "date_closed"
    t.boolean "solved"
    t.boolean "batman_involved"
  end

  create_table "officers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "unit_id"
    t.string "rank"
    t.string "ssn"
    t.integer "role"
    t.string "username"
    t.string "password_digest"
    t.boolean "active", default: true
    t.index ["unit_id"], name: "index_officers_on_unit_id"
  end

  create_table "suspects", force: :cascade do |t|
    t.integer "investigation_id", null: false
    t.integer "criminal_id", null: false
    t.date "added_on"
    t.date "dropped_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["criminal_id"], name: "index_suspects_on_criminal_id"
    t.index ["investigation_id"], name: "index_suspects_on_investigation_id"
  end

  create_table "units", force: :cascade do |t|
    t.string "name"
    t.boolean "active", default: true
  end

  add_foreign_key "assignments", "investigations"
  add_foreign_key "assignments", "officers"
  add_foreign_key "crime_investigations", "crimes"
  add_foreign_key "crime_investigations", "investigations"
  add_foreign_key "investigation_notes", "investigations"
  add_foreign_key "investigation_notes", "officers"
  add_foreign_key "officers", "units"
  add_foreign_key "suspects", "criminals"
  add_foreign_key "suspects", "investigations"
end
