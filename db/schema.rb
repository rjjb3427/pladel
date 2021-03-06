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

ActiveRecord::Schema.define(version: 20140811225506) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "foods", force: true do |t|
    t.string "name"
    t.string "group"
  end

  create_table "foods_users", id: false, force: true do |t|
    t.integer "food_id"
    t.integer "user_id"
  end

  create_table "meals", force: true do |t|
    t.string   "status"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active",     default: true
  end

  add_index "meals", ["user_id"], name: "index_meals_on_user_id", using: :btree

  create_table "movement_sessions", force: true do |t|
    t.integer  "user_id"
    t.float    "steps"
    t.string   "timestamp"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "movement_sessions", ["user_id"], name: "index_movement_sessions_on_user_id", using: :btree

  create_table "sleep_sessions", force: true do |t|
    t.integer  "deep"
    t.integer  "times_woken"
    t.integer  "total"
    t.integer  "user_id"
    t.string   "timestamp"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sleep_sessions", ["user_id"], name: "index_sleep_sessions_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "email",                          null: false
    t.string   "encrypted_password", limit: 128, null: false
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128, null: false
    t.string   "uid"
    t.string   "token"
    t.string   "pid"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
