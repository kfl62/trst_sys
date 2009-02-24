class CreateTrstHrs < ActiveRecord::Migration
  def self.up
    create_table :trst_hrs do |t|
      t.string   "prefix",      :limit => 10, :default => "",     :null => false
      t.string   "frst_name",   :limit => 25, :default => "",     :null => false
      t.string   "mdl_name",    :limit => 25, :default => "",     :null => false
      t.string   "lst_name",    :limit => 25, :default => "",     :null => false
      t.string   "stts",        :limit => 10,  :default => "f;e", :null => false
      t.trsts
    end
  end

  def self.down
    drop_table :trst_hrs
  end
end
