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

ActiveRecord::Schema.define(version: 20130822032808) do

  create_table "opportunities", force: true do |t|
    t.string   "position"
    t.string   "company"
    t.string   "location"
    t.string   "contact"
    t.text     "link",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "track"
    t.integer  "user_id"
    t.text     "notes",       limit: 255
    t.integer  "salary_low"
    t.integer  "salary_high"
  end

  create_table "users", force: true do |t|
    t.string   "uid"
    t.string   "name"
    t.string   "email"
    t.string   "img_url"
    t.string   "oath_token"
    t.datetime "oath_expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "url"
  end

end
