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

ActiveRecord::Schema.define(version: 20160308133807) do

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "slug",       limit: 255
    t.integer  "status",     limit: 4,   default: 0
    t.datetime "deleted_at"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "categories", ["deleted_at"], name: "index_categories_on_deleted_at", using: :btree

  create_table "item_categories", force: :cascade do |t|
    t.integer  "item_id",     limit: 4
    t.integer  "category_id", limit: 4
    t.datetime "deleted_at"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "item_categories", ["category_id"], name: "index_item_categories_on_category_id", using: :btree
  add_index "item_categories", ["deleted_at"], name: "index_item_categories_on_deleted_at", using: :btree
  add_index "item_categories", ["item_id"], name: "index_item_categories_on_item_id", using: :btree

  create_table "items", force: :cascade do |t|
    t.string   "name",       limit: 255,             null: false
    t.integer  "price",      limit: 4,               null: false
    t.string   "image",      limit: 255
    t.string   "slug",       limit: 255
    t.integer  "status",     limit: 4,   default: 0
    t.datetime "deleted_at"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "items", ["deleted_at"], name: "index_items_on_deleted_at", using: :btree

  create_table "photos", force: :cascade do |t|
    t.integer  "item_id",    limit: 4
    t.string   "image",      limit: 255
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "photos", ["item_id"], name: "index_photos_on_item_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "user_name",  limit: 255
    t.string   "real_name",  limit: 255
    t.string   "gender",     limit: 255
    t.string   "address",    limit: 255
    t.string   "uid",        limit: 255
    t.string   "phone",      limit: 255
    t.integer  "status",     limit: 4,   default: 1
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
