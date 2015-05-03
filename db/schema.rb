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

ActiveRecord::Schema.define(version: 20150503152005) do

  create_table "after_schools", force: true do |t|
    t.date     "date"
    t.datetime "time_in"
    t.datetime "time_out"
    t.integer  "total_minutes"
    t.integer  "homework_time"
    t.integer  "literacy_time"
    t.integer  "technology_time"
    t.integer  "reading_specialist_time"
    t.text     "goal"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "program_id"
    t.integer  "child_id"
    t.text     "notes"
    t.integer  "physical_activity"
    t.integer  "hands_on_activity"
  end

  create_table "assignments", force: true do |t|
    t.integer  "instructor_id"
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "child_locations", force: true do |t|
    t.integer  "child_id"
    t.integer  "location_id"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "children", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.date     "date_of_birth"
    t.string   "grade"
    t.integer  "school_id"
    t.integer  "guardian_id"
    t.boolean  "active",        default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "enrichment_days", force: true do |t|
    t.integer  "child_id"
    t.integer  "enrichment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "enrichments", force: true do |t|
    t.float    "length"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "program_id"
    t.integer  "provider_id"
  end

  create_table "enrollments", force: true do |t|
    t.integer  "program_id"
    t.integer  "child_id"
    t.date     "date_enrolled"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "field_trip_days", force: true do |t|
    t.integer  "child_id"
    t.integer  "field_trip_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "field_trips", force: true do |t|
    t.float    "length"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "program_id"
    t.integer  "provider_id"
  end

  create_table "guardian_locations", force: true do |t|
    t.integer  "guardian_id"
    t.integer  "location_id"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "guardians", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "email"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "date_of_birth"
  end

  create_table "instructors", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", force: true do |t|
    t.string   "name"
    t.string   "address_line_one"
    t.string   "address_line_two"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "programs", force: true do |t|
    t.string   "name"
    t.string   "program_type"
    t.string   "start_date"
    t.string   "end_date"
    t.integer  "location_id",  limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "providers", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "school_districts", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schools", force: true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "address_line_one"
    t.string   "address_line_two"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_district_id"
  end

  create_table "sub_locations", force: true do |t|
    t.string   "name"
    t.string   "address_line_one"
    t.string   "address_line_two"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "location_id"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.string   "role"
    t.boolean  "active",          default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "instructor_id"
  end

end
