class CreateTrstSysPages < ActiveRecord::Migration
  def self.up
    create_table :trst_sys_pages do |t|
      t.string "controller",      :limit => '15',     :default => 'pub',      :null => false
      t.string "chapter",         :limit => '2',      :default => '01',       :null => false
      t.string "page",            :limit => '2',      :default => '01',       :null => false
      t.text "title"
      t.text "intro"
      t.text "actions"
      t.text "content"
      t.text "note"
      t.trsts
    end
  end

  def self.down
    drop_table :trst_sys_pages
  end
end
