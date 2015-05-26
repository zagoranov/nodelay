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

ActiveRecord::Schema.define(version: 20150526075417) do

  create_table "impulses", force: true do |t|
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "impulsetreattype_id"
  end

  create_table "impulsetreattypes", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.boolean  "small",       default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.boolean  "erased",      default: false
  end

  create_table "tasks", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.boolean  "done",        default: false
    t.integer  "grade"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "treats", force: true do |t|
    t.boolean  "done",                default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "impulse_id"
    t.integer  "impulsetreattype_id"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.datetime "lastmove"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.boolean  "admin"
    t.integer  "randchance",    default: 4
    t.integer  "score",         default: 0
  end

end
