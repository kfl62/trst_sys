class CreateTrstUsers < ActiveRecord::Migration
  def self.up
    create_table :trst_users do |t|
      t.string    "login", :null => false
      t.string    "frst_name"
      t.string    "mdl_name"
      t.string    "lst_name"
      t.string    "email"
      t.string    "crypted_password", :null => false
      t.string    "password_salt", :null => false
      t.string    "persistence_token", :null => false
      t.integer   "login_count", :default => 0, :null => false
      t.datetime  "last_request_at"
      t.datetime  "last_login_at"
      t.datetime  "current_login_at"
      t.string    "last_login_ip"
      t.string    "current_login_ip"
      t.trsts
    end
    add_index :trst_users, :login
    add_index :trst_users, :persistence_token
    add_index :trst_users, :last_request_at
  end

  def self.down
    drop_table :trst_users
  end
end
