class CreateTrstSysMenus < ActiveRecord::Migration
  def self.up
    create_table :trst_sys_menus do |t|
      t.string "name",            :limit => '15',     :default => 'Menu',     :null => false
      t.string "controller",      :limit => '15',     :default => 'pub',      :null => false
      t.string "chapter",         :limit => '2',      :default => '01',       :null => false
      t.string "page",            :limit => '2',      :default => '01',       :null => false
      t.boolean "has_submenu",                        :default => true,       :null => false
      t.string "title",           :limit => '25',     :default => '...?...',  :null => false
      t.trsts
    end
  end

  def self.down
    drop_table :trst_sys_menus
  end
end
