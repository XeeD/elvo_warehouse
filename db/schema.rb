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

ActiveRecord::Schema.define(version: 20140129131717) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cells", force: true do |t|
    t.integer  "coordinate_x", null: false
    t.integer  "coordinate_y", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "hall_id",      null: false
    t.integer  "location_id"
  end

  create_table "halls", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "storage_id", null: false
    t.integer  "length",     null: false
    t.integer  "width",      null: false
  end

  create_table "locations", force: true do |t|
    t.string   "name",              null: false
    t.integer  "capacity",          null: false
    t.integer  "location_type",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "hall_id",           null: false
    t.integer  "selection_start_x", null: false
    t.integer  "selection_start_y", null: false
    t.integer  "selection_end_x",   null: false
    t.integer  "selection_end_y",   null: false
  end

  add_index "locations", ["hall_id"], name: "index_locations_on_hall_id", using: :btree

  create_table "placements", force: true do |t|
    t.integer "location_id",      null: false
    t.integer "stock_article_id", null: false
    t.integer "quantity",         null: false
  end

  add_index "placements", ["location_id", "stock_article_id"], name: "index_placements_on_location_id_and_stock_article_id", unique: true, using: :btree
  add_index "placements", ["quantity"], name: "index_placements_on_quantity", using: :btree

  create_table "stock_articles", force: true do |t|
    t.string   "cezar_id",         limit: 30,             null: false
    t.integer  "stock_type",                              null: false
    t.integer  "ean_code",         limit: 8
    t.integer  "quantity",                    default: 0, null: false
    t.integer  "ordered_quantity",            default: 0, null: false
    t.integer  "weight"
    t.integer  "size"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "stock_articles", ["cezar_id", "stock_type"], name: "index_stock_articles_on_cezar_id_and_stock_type", unique: true, using: :btree

  create_table "storages", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
