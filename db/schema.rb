# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090121094556) do

  create_table "trst_sys_menus", :force => true do |t|
    t.string   "name",        :limit => 15, :default => "Menu",    :null => false
    t.string   "controller",  :limit => 15, :default => "pub",     :null => false
    t.string   "chapter",     :limit => 2,  :default => "01",      :null => false
    t.string   "page",        :limit => 2,  :default => "01",      :null => false
    t.boolean  "has_submenu",               :default => true,      :null => false
    t.string   "title",       :limit => 25, :default => "...?...", :null => false
    t.datetime "created_on"
    t.integer  "created_by",  :limit => 6,  :default => 0,         :null => false
    t.datetime "updated_on"
    t.integer  "updated_by",  :limit => 6,  :default => 0,         :null => false
    t.integer  "approved_by", :limit => 6,  :default => 0,         :null => false
  end

  create_table "trst_sys_submenus", :force => true do |t|
    t.integer  "trst_sys_menu_id", :limit => 6,  :default => 1,         :null => false
    t.string   "name",             :limit => 15, :default => "Menu",    :null => false
    t.string   "controller",       :limit => 15, :default => "pub",     :null => false
    t.string   "chapter",          :limit => 2,  :default => "01",      :null => false
    t.string   "page",             :limit => 2,  :default => "01",      :null => false
    t.boolean  "active",                         :default => true,      :null => false
    t.string   "title",            :limit => 25, :default => "...?...", :null => false
    t.datetime "created_on"
    t.integer  "created_by",       :limit => 6,  :default => 0,         :null => false
    t.datetime "updated_on"
    t.integer  "updated_by",       :limit => 6,  :default => 0,         :null => false
    t.integer  "approved_by",      :limit => 6,  :default => 0,         :null => false
  end

  create_table "trst_users", :force => true do |t|
    t.string   "login",                                         :null => false
    t.string   "frst_name"
    t.string   "mdl_name"
    t.string   "lst_name"
    t.string   "email"
    t.string   "crypted_password",                              :null => false
    t.string   "password_salt",                                 :null => false
    t.string   "persistence_token",                             :null => false
    t.integer  "login_count",                    :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "last_login_at"
    t.datetime "current_login_at"
    t.string   "last_login_ip"
    t.string   "current_login_ip"
    t.datetime "created_on"
    t.integer  "created_by",        :limit => 6, :default => 0, :null => false
    t.datetime "updated_on"
    t.integer  "updated_by",        :limit => 6, :default => 0, :null => false
    t.integer  "approved_by",       :limit => 6, :default => 0, :null => false
  end

  add_index "trst_users", ["last_request_at"], :name => "index_trst_users_on_last_request_at"
  add_index "trst_users", ["login"], :name => "index_trst_users_on_login"
  add_index "trst_users", ["persistence_token"], :name => "index_trst_users_on_persistence_token"

  create_table "trst_users_sessions", :force => true do |t|
    t.string   "session_id",                              :null => false
    t.text     "data"
    t.datetime "created_on"
    t.integer  "created_by",  :limit => 6, :default => 0, :null => false
    t.datetime "updated_on"
    t.integer  "updated_by",  :limit => 6, :default => 0, :null => false
    t.integer  "approved_by", :limit => 6, :default => 0, :null => false
  end

  add_index "trst_users_sessions", ["session_id"], :name => "index_trst_users_sessions_on_session_id"
  add_index "trst_users_sessions", ["updated_on"], :name => "index_trst_users_sessions_on_updated_on"

end
