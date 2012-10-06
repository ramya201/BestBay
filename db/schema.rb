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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121006134556) do

  create_table "brands", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "brands", ["name"], :name => "index_brands_on_name", :unique => true

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "categories", ["name"], :name => "index_categories_on_name", :unique => true

  create_table "items", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "image"
    t.integer  "start_price"
    t.integer  "instant_price"
    t.integer  "quantity"
    t.string   "sale_type"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "user_id"
    t.integer  "brand_id"
    t.integer  "category_id"
    t.integer  "subcategory_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "subcategories", :force => true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "subcategories", ["name"], :name => "index_subcategories_on_name", :unique => true

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "password"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "image"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
