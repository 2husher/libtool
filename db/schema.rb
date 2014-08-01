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

ActiveRecord::Schema.define(version: 20140801113553) do

  create_table "books", force: true do |t|
    t.integer  "reader_id"
    t.string   "identity"
    t.string   "title"
    t.string   "author"
    t.text     "annotation"
    t.integer  "publishing_year"
    t.date     "returning_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "books", ["reader_id"], name: "index_books_on_reader_id"

  create_table "librarians", force: true do |t|
    t.string   "name"
    t.datetime "birthday"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "readers", force: true do |t|
    t.integer  "reader_card_id"
    t.string   "name"
    t.datetime "birthday"
    t.string   "address"
    t.text     "notes"
    t.boolean  "is_banned"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end