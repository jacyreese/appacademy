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

ActiveRecord::Schema.define(version: 20150709003021) do

  create_table "shortened_urls", force: :cascade do |t|
    t.string   "long_url"
    t.string   "short_url"
    t.integer  "submitter_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shortened_urls", ["short_url"], name: "index_shortened_urls_on_short_url", unique: true
  add_index "shortened_urls", ["submitter_id"], name: "index_shortened_urls_on_submitter_id"

  create_table "taggings", force: :cascade do |t|
    t.integer  "url_id"
    t.integer  "tagtopic_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "taggings", ["tagtopic_id"], name: "index_taggings_on_tagtopic_id"
  add_index "taggings", ["url_id"], name: "index_taggings_on_url_id"

  create_table "tagtopics", force: :cascade do |t|
    t.string   "topic"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tagtopics", ["topic"], name: "index_tagtopics_on_topic"

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "premium",    default: false
  end

  add_index "users", ["email"], name: "index_users_on_email"

  create_table "visits", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "shortened_url_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "visits", ["shortened_url_id"], name: "index_visits_on_shortened_url_id"
  add_index "visits", ["user_id"], name: "index_visits_on_user_id"

  create_table "votes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "url_id"
    t.boolean  "up"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
