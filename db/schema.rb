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

ActiveRecord::Schema.define(version: 20171025180830) do

  create_table "enviros", force: :cascade do |t|
    t.integer  "humidity"
    t.integer  "temperature"
    t.datetime "dt"
    t.integer  "user_id"
    t.integer  "co2"
    t.integer  "light"
  end

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
    t.boolean  "done",          default: false
    t.datetime "donedt"
    t.integer  "projecttip_id"
    t.boolean  "hideincalend",  default: false
  end

  create_table "projecttips", force: :cascade do |t|
    t.text "name"
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "donedt"
    t.boolean  "actual",      default: true
    t.datetime "dt"
    t.boolean  "calendarity", default: true
    t.integer  "project_id"
    t.string   "object"
    t.string   "action"
    t.text     "description"
    t.string   "schedulerid"
    t.integer  "tasktip_id"
    t.boolean  "itislink",    default: false
  end

  create_table "tasks_tags", force: :cascade do |t|
    t.integer "task_id"
    t.integer "tag_id"
  end

  create_table "tasktips", force: :cascade do |t|
    t.text "name"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "lastmove"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.boolean  "admin"
    t.string   "schedule_url"
    t.boolean  "schedules",     default: false
  end

end
