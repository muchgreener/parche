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

ActiveRecord::Schema.define(:version => 20120505222319) do

  create_table "categories", :force => true do |t|
    t.integer  "parent_id"
    t.integer  "display_order"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.boolean  "active",        :default => true
  end

  create_table "category_products", :force => true do |t|
    t.integer  "category_id"
    t.integer  "product_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "checkins", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "item_id"
  end

  add_index "checkins", ["item_id"], :name => "index_checkins_on_item_id"
  add_index "checkins", ["user_id"], :name => "index_checkins_on_user_id"

  create_table "comments", :force => true do |t|
    t.integer  "checkin_id"
    t.integer  "user_id"
    t.text     "comments"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "friendships", :force => true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.integer  "status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "friendships", ["user_id", "friend_id", "status"], :name => "index_friendships_on_user_id_and_friend_id_and_status", :unique => true

  create_table "items", :force => true do |t|
    t.integer  "venue_product_id"
    t.decimal  "price",            :precision => 10, :scale => 0
    t.datetime "created_at",                                                        :null => false
    t.datetime "updated_at",                                                        :null => false
    t.integer  "checkin_count",                                   :default => 0
    t.boolean  "active",                                          :default => true
  end

  add_index "items", ["venue_product_id", "price"], :name => "index_items_on_venue_product_id_and_price", :unique => true
  add_index "items", ["venue_product_id"], :name => "index_items_on_venue_product_id"

  create_table "products", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.float    "price"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.boolean  "active",      :default => true
  end

  add_index "products", ["description"], :name => "index_products_on_description"
  add_index "products", ["name"], :name => "index_products_on_name"

  create_table "profiles", :force => true do |t|
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "gender"
    t.integer  "city_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  create_table "user_followups", :force => true do |t|
    t.integer  "user_id"
    t.string   "fs_venue_id"
    t.integer  "category_id"
    t.integer  "product_id"
    t.boolean  "active"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "authentication_token"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.integer  "roles_mask"
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "venue_categories", :force => true do |t|
    t.string   "fs_category_id"
    t.string   "name"
    t.integer  "status"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "parent_id"
  end

  add_index "venue_categories", ["fs_category_id"], :name => "index_venue_categories_on_fs_category_id", :unique => true

  create_table "venue_products", :force => true do |t|
    t.string   "venue_id"
    t.integer  "product_id"
    t.datetime "created_at",                                                              :null => false
    t.datetime "updated_at",                                                              :null => false
    t.decimal  "price",                  :precision => 10, :scale => 0
    t.decimal  "last_checkin_price",     :precision => 10, :scale => 0
    t.decimal  "most_checkin_price",     :precision => 10, :scale => 0
    t.integer  "checkin_count",                                         :default => 0
    t.integer  "most_checkined_item_id"
    t.integer  "last_checkined_item_id"
    t.integer  "verified_item_id"
    t.string   "fs_venue_id"
    t.boolean  "active",                                                :default => true
  end

  add_index "venue_products", ["fs_venue_id", "product_id"], :name => "index_venue_products_on_fs_venue_id_and_product_id", :unique => true
  add_index "venue_products", ["fs_venue_id"], :name => "index_venue_products_on_fs_venue_id"
  add_index "venue_products", ["product_id"], :name => "index_venue_products_on_product_id"
  add_index "venue_products", ["venue_id"], :name => "index_venue_products_on_venue_id"

  create_table "venues", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",                                                   :null => false
    t.datetime "updated_at",                                                   :null => false
    t.integer  "product_count",                                 :default => 0
    t.string   "fs_venue_id"
    t.decimal  "lat",           :precision => 19, :scale => 15
    t.decimal  "lng",           :precision => 19, :scale => 15
  end

  add_index "venues", ["fs_venue_id"], :name => "index_venues_on_fs_venue_id"
  add_index "venues", ["lat", "lng"], :name => "index_venues_on_lat_and_lng"

end
