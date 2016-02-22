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

ActiveRecord::Schema.define(version: 20160222163205) do

  create_table "friendships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profilecomments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "commenter_id"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "description"
    t.datetime "lastmove"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tip",         default: 1
    t.boolean  "done",        default: false
    t.datetime "donedt"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
  end

  create_table "tags_tasks", id: false, force: :cascade do |t|
    t.integer "tag_id"
    t.integer "task_id"
  end

  add_index "tags_tasks", ["tag_id"], name: "index_tags_tasks_on_tag_id"
  add_index "tags_tasks", ["task_id"], name: "index_tags_tasks_on_task_id"

  create_table "tasks", force: :cascade do |t|
    t.boolean  "done",        default: false
    t.integer  "grade",       default: 3
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "donedt"
    t.boolean  "actual",      default: true
    t.datetime "dt"
    t.boolean  "calendarity", default: false
    t.integer  "project_id"
    t.string   "object"
    t.string   "action"
  end

  create_table "tasks_tags", force: :cascade do |t|
    t.integer "task_id"
    t.integer "tag_id"
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
  end

end
