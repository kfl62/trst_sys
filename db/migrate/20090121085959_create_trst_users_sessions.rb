class CreateTrstUsersSessions < ActiveRecord::Migration
  def self.up
    create_table "trst_users_sessions", :force => true do |t|
      t.string    "session_id", :null => false
      t.text      "data"
      t.trsts
    end

    add_index :trst_users_sessions, :session_id
    add_index :trst_users_sessions, :updated_on
  end

  def self.down
    drop_table :trst_users_sessions
  end
end
