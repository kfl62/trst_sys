class CreateTrstSysSubmenus < ActiveRecord::Migration
  def self.up
    create_table :trst_sys_submenus do |t|
      t.integer "trst_sys_menu_id",  :limit => '6',      :default => 1,          :null => false
      t.string "name",               :limit => '15',     :default => 'Menu',     :null => false
      t.string "controller",         :limit => '15',     :default => 'pub',      :null => false
      t.string "chapter",            :limit => '2',      :default => '01',       :null => false
      t.string "page",               :limit => '2',      :default => '01',       :null => false
      t.boolean "active",                                :default => true,       :null => false
      t.string "title",              :limit => '25',     :default => '...?...',  :null => false
      t.trsts
    end
  end

  def self.down
    drop_table :trst_sys_submenus
  end
end
