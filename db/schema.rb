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

ActiveRecord::Schema.define(:version => 20090224123553) do

  create_table "trst_hmrs", :force => true do |t|
    t.string   "prefix",      :limit => 10, :default => "",    :null => false
    t.string   "lstname",     :limit => 25, :default => "",    :null => false
    t.string   "mdlname",     :limit => 25, :default => "",    :null => false
    t.string   "frstname",    :limit => 25, :default => "",    :null => false
    t.string   "stts",        :limit => 10, :default => "f;e", :null => false
    t.datetime "created_on"
    t.integer  "created_by",  :limit => 6,  :default => 0,     :null => false
    t.datetime "updated_on"
    t.integer  "updated_by",  :limit => 6,  :default => 0,     :null => false
    t.integer  "approved_by", :limit => 6,  :default => 0,     :null => false
  end

  create_table "trst_hrs", :force => true do |t|
    t.string   "prefix",      :limit => 10, :default => "",    :null => false
    t.string   "lstname",     :limit => 25, :default => "",    :null => false
    t.string   "mdlname",     :limit => 25, :default => "",    :null => false
    t.string   "frstname",    :limit => 25, :default => "",    :null => false
    t.string   "stts",        :limit => 10, :default => "f;e", :null => false
    t.datetime "created_on"
    t.integer  "created_by",  :limit => 6,  :default => 0,     :null => false
    t.datetime "updated_on"
    t.integer  "updated_by",  :limit => 6,  :default => 0,     :null => false
    t.integer  "approved_by", :limit => 6,  :default => 0,     :null => false
  end

  create_table "trst_prtns", :force => true do |t|
    t.string   "prefix",        :limit => 10,  :default => "", :null => false
    t.string   "name",          :limit => 100, :default => "", :null => false
    t.string   "suffix",        :limit => 10,  :default => "", :null => false
    t.string   "namesh",        :limit => 10,  :default => "", :null => false
    t.string   "id_chamcom",    :limit => 25,  :default => "", :null => false
    t.string   "id_fiscal",     :limit => 15,  :default => "", :null => false
    t.string   "id_itm",        :limit => 15,  :default => "", :null => false
    t.string   "id_account",    :limit => 15,  :default => "", :null => false
    t.string   "id_internet",   :limit => 15,  :default => "", :null => false
    t.string   "address",       :limit => 100, :default => "", :null => false
    t.string   "city",          :limit => 30,  :default => "", :null => false
    t.string   "zip",           :limit => 30,  :default => "", :null => false
    t.string   "state",         :limit => 30,  :default => "", :null => false
    t.integer  "id_country",    :limit => 4,   :default => 0,  :null => false
    t.string   "contactpers",   :limit => 30,  :default => "", :null => false
    t.string   "contactpers_q", :limit => 25,  :default => "", :null => false
    t.string   "tel",           :limit => 30,  :default => "", :null => false
    t.string   "fax",           :limit => 30,  :default => "", :null => false
    t.string   "email",         :limit => 30,  :default => "", :null => false
    t.string   "webaddress",    :limit => 30,  :default => "", :null => false
    t.datetime "created_on"
    t.integer  "created_by",    :limit => 6,   :default => 0,  :null => false
    t.datetime "updated_on"
    t.integer  "updated_by",    :limit => 6,   :default => 0,  :null => false
    t.integer  "approved_by",   :limit => 6,   :default => 0,  :null => false
  end

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

  create_table "trst_sys_pages", :force => true do |t|
    t.string   "controller",  :limit => 15, :default => "pub", :null => false
    t.string   "chapter",     :limit => 2,  :default => "01",  :null => false
    t.string   "page",        :limit => 2,  :default => "01",  :null => false
    t.text     "title"
    t.text     "intro"
    t.text     "actions"
    t.text     "content"
    t.text     "note"
    t.datetime "created_on"
    t.integer  "created_by",  :limit => 6,  :default => 0,     :null => false
    t.datetime "updated_on"
    t.integer  "updated_by",  :limit => 6,  :default => 0,     :null => false
    t.integer  "approved_by", :limit => 6,  :default => 0,     :null => false
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

  create_table "trst_sys_tasks", :force => true do |t|
    t.integer  "trst_sys_page_id", :limit => 6,  :default => 34,        :null => false
    t.string   "prefix",           :limit => 15, :default => "info",    :null => false
    t.string   "exe_id",           :limit => 20, :default => "...?...", :null => false
    t.string   "exe_params",       :limit => 40, :default => "...?...", :null => false
    t.string   "name",             :limit => 15, :default => "...?...", :null => false
    t.text     "title"
    t.text     "info"
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
