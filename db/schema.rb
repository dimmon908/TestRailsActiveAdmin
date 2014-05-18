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

ActiveRecord::Schema.define(version: 20140516033229) do

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "city", force: true do |t|
    t.string   "name"
    t.integer  "region_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "city", ["region_id"], name: "index_city_on_region_id", using: :btree

  create_table "manufacturs", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_photos", force: true do |t|
    t.integer  "product_id"
    t.string   "photo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "product_photos", ["product_id"], name: "index_product_photos_on_product_id", using: :btree

  create_table "products", force: true do |t|
    t.string   "name"
    t.decimal  "price",         precision: 10, scale: 0
    t.integer  "city_id"
    t.integer  "region_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "manufactur_id"
  end

  add_index "products", ["city_id"], name: "index_products_on_city_id", using: :btree
  add_index "products", ["manufactur_id"], name: "index_products_on_manufactur_id", using: :btree
  add_index "products", ["region_id"], name: "index_products_on_region_id", using: :btree

  create_table "regions", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
