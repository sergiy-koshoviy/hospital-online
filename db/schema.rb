# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160117090654) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: true do |t|
    t.integer  "user_id"
    t.string   "address_line1"
    t.string   "address_line2"
    t.string   "city"
    t.string   "state_id"
    t.string   "country_id"
    t.string   "zip_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "countries", force: true do |t|
    t.string   "name"
    t.string   "code"
    t.string   "url"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "states"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "countries", ["code"], name: "countries_code_id", using: :btree

  create_table "diseases_categories", force: true do |t|
    t.string "name"
    t.string "doctors_category_id"
  end

  create_table "doctors", force: true do |t|
    t.string   "name"
    t.integer  "doctors_category_id"
    t.string   "address"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "doctors_categories", force: true do |t|
    t.string "name"
  end

  create_table "medical_histories", force: true do |t|
    t.integer  "user_id"
    t.integer  "diseases_category_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "medical_histories_symptoms", id: false, force: true do |t|
    t.integer "medical_history_id", null: false
    t.integer "symptom_id",         null: false
  end

  create_table "states", force: true do |t|
    t.integer  "country_id"
    t.string   "code"
    t.string   "url"
    t.string   "name"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "cities"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "states", ["code"], name: "states_code_id", using: :btree
  add_index "states", ["country_id"], name: "states_country_id", using: :btree

  create_table "symptoms", force: true do |t|
    t.string   "name"
    t.integer  "diseases_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_roles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_roles_users", id: false, force: true do |t|
    t.integer "user_id",      null: false
    t.integer "user_role_id", null: false
  end

