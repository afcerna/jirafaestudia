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

ActiveRecord::Schema.define(version: 20170721165613) do

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "total_hours_to_finish"
    t.integer  "worked_hours"
    t.integer  "User_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["User_id"], name: "index_projects_on_User_id"
  end

  create_table "time_entries", force: :cascade do |t|
    t.integer  "number_of_hours"
    t.date     "date"
    t.string   "description"
    t.integer  "Project_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["Project_id"], name: "index_time_entries_on_Project_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
