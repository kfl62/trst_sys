class CreateTrstSysTasks < ActiveRecord::Migration
  def self.up
    create_table :trst_sys_tasks do |t|
      t.integer "trst_sys_page_id", :limit => '6',        :default => 34,               :null => false
      t.string "prefix",            :limit => '15',       :default => 'sys',            :null => false
      t.string "exe_id",            :limit => '20',       :default => '...?...',        :null => false
      t.string "exe_params",        :limit => '40',       :default => '...?...',        :null => false
      t.string "name",              :limit => '15',       :default => '...?...',        :null => false
      t.text "title"
      t.text "info"
      t.trsts
    end
  end

  def self.down
    drop_table :trst_sys_tasks
  end
end

