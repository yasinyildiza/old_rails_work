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

ActiveRecord::Schema.define(:version => 20131213143317) do

  create_table "archived_notifications", :force => true do |t|
    t.integer  "notification_type_id"
    t.integer  "notification_status_id"
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "mail"
    t.string   "phone_number"
    t.string   "subject"
    t.string   "content"
    t.datetime "day"
    t.datetime "hour"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  create_table "notification_statuses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "notification_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "notifications", :force => true do |t|
    t.integer  "notification_type_id"
    t.integer  "notification_status_id", :default => 1
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "mail"
    t.string   "phone_number"
    t.string   "subject"
    t.string   "content"
    t.datetime "day"
    t.datetime "hour"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "mail"
    t.string   "phone_number"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
