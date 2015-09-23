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

ActiveRecord::Schema.define(version: 20150923114212) do

  create_table "friendships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "impulses", force: :cascade do |t|
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "impulsetreattype_id"
  end

  create_table "impulsetreattypes", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.text     "description"
    t.boolean  "small",                   default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.boolean  "erased",                  default: false
    t.string   "url",         limit: 255
  end

  create_table "profilecomments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "commenter_id"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.text     "description"
    t.boolean  "done",                    default: false
    t.integer  "grade",                   default: 5
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "icon",        limit: 255, default: "001"
    t.datetime "donedt"
    t.boolean  "actual",                  default: true
    t.boolean  "longbox",                 default: false
    t.datetime "dt"
    t.boolean  "calendarity",             default: false
  end

  create_table "treats", force: :cascade do |t|
    t.boolean  "done",                            default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "impulse_id"
    t.integer  "impulsetreattype_id"
    t.string   "icon",                limit: 255, default: "01"
    t.datetime "donedt"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.datetime "lastmove"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",         limit: 255
    t.string   "password_hash", limit: 255
    t.string   "password_salt", limit: 255
    t.boolean  "admin"
    t.integer  "randchance",                default: 4
    t.integer  "score",                     default: 0
  end

end
