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

ActiveRecord::Schema.define(version: 20150114172806) do

  create_table "foods", force: true do |t|
    t.string   "name"
    t.string   "category"
    t.integer  "user_id"
    t.date     "due"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uid"
  end

  create_table "icook_recipes", force: true do |t|
    t.string   "url"
    t.string   "title"
    t.string   "image_url"
    t.string   "description"
    t.string   "ingredient"
    t.string   "step"
    t.string   "match_ingredient"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ingredients", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "want_foods", force: true do |t|
    t.string   "name"
    t.string   "category"
    t.string   "uid"
    t.date     "due"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
