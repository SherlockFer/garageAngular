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

ActiveRecord::Schema.define(version: 0) do

  create_table "bookings", force: :cascade do |t|
    t.string  "vehicle_number_plate", limit: 25
    t.string  "vehicle_model",        limit: 25
    t.string  "vehicle_brand",        limit: 25
    t.string  "vehicle_engine",       limit: 25
    t.date    "date",                              null: false
    t.string  "status",               limit: 20,   null: false
    t.string  "comments",             limit: 1000
    t.integer "service_id",           limit: 4,    null: false
    t.integer "mechanic_id",          limit: 4
    t.integer "customer_id",          limit: 4
    t.string  "vehicle_type",         limit: 25
  end

  add_index "bookings", ["customer_id"], name: "customer_id_fk_idx", using: :btree
  add_index "bookings", ["mechanic_id"], name: "mechanic_id_fk_idx", using: :btree
  add_index "bookings", ["service_id"], name: "service_id_fk_idx", using: :btree

  create_table "bookings_parts", force: :cascade do |t|
    t.integer "booking_id", limit: 4
    t.integer "part_id",    limit: 4
  end

  add_index "bookings_parts", ["booking_id"], name: "booking_id_fk_idx", using: :btree
  add_index "bookings_parts", ["part_id"], name: "parts_id_fk_idx", using: :btree

  create_table "bookings_services", force: :cascade do |t|
    t.integer "booking_id", limit: 4
    t.integer "service_id", limit: 4
  end

  add_index "bookings_services", ["booking_id"], name: "booking_id_fk_idx", using: :btree
  add_index "bookings_services", ["service_id"], name: "services_id_fk_idx", using: :btree

  create_table "parts", force: :cascade do |t|
    t.string  "name",  limit: 25,                null: false
    t.decimal "price",            precision: 10, null: false
  end

  create_table "services", force: :cascade do |t|
    t.string  "name",     limit: 25,                null: false
    t.string  "category", limit: 25,                null: false
    t.decimal "price",               precision: 10, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "full_name",       limit: 45,  null: false
    t.string   "email",           limit: 255, null: false
    t.string   "mobile",          limit: 20,  null: false
    t.string   "role",            limit: 25,  null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "password_digest", limit: 255, null: false
  end

  add_index "users", ["email"], name: "email", unique: true, using: :btree

  add_foreign_key "bookings", "services", name: "service_id_fk"
  add_foreign_key "bookings", "users", column: "customer_id", name: "customer_id_fk"
  add_foreign_key "bookings", "users", column: "mechanic_id", name: "mechanic_id_fk"
  add_foreign_key "bookings_parts", "bookings", name: "booking_part_fk"
  add_foreign_key "bookings_parts", "parts", name: "parts_id_fk"
  add_foreign_key "bookings_services", "bookings", name: "booking_service_fk"
  add_foreign_key "bookings_services", "services", name: "services_id_fk"
end
