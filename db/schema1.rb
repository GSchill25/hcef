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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20150227013915) do

  create_table "after_schools", force: true do |t|
    t.date     "date"
    t.datetime "time_in"
    t.datetime "time_out"
    t.float    "total_hours"
    t.time     "homework_time"
    t.time     "literacy_time"
    t.time     "technology_time"
    t.time     "reading_specialist_time"
    t.text     "goal"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "program_id"
  end

  create_table "enrichments", force: true do |t|
    t.float    "length"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "program_id"
    t.integer  "provider_id"
  end

  create_table "field_trips", force: true do |t|
    t.float    "length"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "program_id"
  end

  create_table "locations", force: true do |t|
    t.string   "name"
=======
ActiveRecord::Schema.define(version: 20150224193500) do

  create_table "children", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.date     "date_of_birth"
    t.string   "grade"
    t.integer  "school_id"
    t.integer  "guardian_id"
    t.boolean  "active"
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
  end

  create_table "schools", force: true do |t|
    t.string   "name"
    t.string   "phone"
>>>>>>> 82285acff3fd47c71d6cda1b43b6f401b7f18208
    t.string   "address_line_one"
    t.string   "address_line_two"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
<<<<<<< HEAD
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "programs", force: true do |t|
    t.string   "name"
    t.string   "type"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "location_id"
  end

  create_table "providers", force: true do |t|
    t.string   "name"
=======
>>>>>>> 82285acff3fd47c71d6cda1b43b6f401b7f18208
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
