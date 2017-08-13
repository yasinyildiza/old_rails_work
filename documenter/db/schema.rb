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

ActiveRecord::Schema.define(:version => 20141119133639) do

  create_table "class_types", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "data_members", :force => true do |t|
    t.integer  "model_class_id"
    t.string   "name"
    t.integer  "data_type_id"
    t.string   "default_value"
    t.string   "calculation"
    t.string   "description"
    t.string   "warning"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "data_members", ["data_type_id"], :name => "index_data_members_on_data_type_id"
  add_index "data_members", ["model_class_id"], :name => "index_data_members_on_model_class_id"

  create_table "data_types", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "method_members", :force => true do |t|
    t.integer  "model_class_id"
    t.string   "name"
    t.integer  "method_type_id"
    t.boolean  "override",       :default => false
    t.string   "description"
    t.string   "warning"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  add_index "method_members", ["method_type_id"], :name => "index_method_members_on_method_type_id"
  add_index "method_members", ["model_class_id"], :name => "index_method_members_on_model_class_id"

  create_table "method_parameters", :force => true do |t|
    t.integer  "method_member_id"
    t.string   "name"
    t.integer  "data_type_id"
    t.string   "description"
    t.string   "warning"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "method_parameters", ["data_type_id"], :name => "index_method_parameters_on_data_type_id"
  add_index "method_parameters", ["method_member_id"], :name => "index_method_parameters_on_method_member_id"

  create_table "method_types", :force => true do |t|
    t.string   "name"
    t.string   "character"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "model_class_ownerships", :force => true do |t|
    t.integer  "owner_class_id"
    t.integer  "model_class_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "model_classes", :force => true do |t|
    t.integer  "project_id"
    t.string   "name"
    t.integer  "class_type_id"
    t.boolean  "abstract",              :default => false
    t.string   "description"
    t.string   "warning"
    t.integer  "parent_model_class_id"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  add_index "model_classes", ["class_type_id"], :name => "index_model_classes_on_class_type_id"
  add_index "model_classes", ["project_id"], :name => "index_model_classes_on_project_id"

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "return_values", :force => true do |t|
    t.integer  "method_member_id"
    t.integer  "data_type_id"
    t.string   "description"
    t.string   "warning"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "return_values", ["data_type_id"], :name => "index_return_values_on_data_type_id"
  add_index "return_values", ["method_member_id"], :name => "index_return_values_on_method_member_id"

end
