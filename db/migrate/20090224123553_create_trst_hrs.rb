class CreateTrstHrs < ActiveRecord::Migration
  def self.up
    create_table :trst_hrs do |t|
      t.string   "prefix",      :limit => 10, :default => "",     :null => false
      t.string   "lstname",     :limit => 25, :default => "",     :null => false
      t.string   "mdlname",     :limit => 25, :default => "",     :null => false
      t.string   "frstname",    :limit => 25, :default => "",     :null => false
      t.string   "stts",        :limit => 10,  :default => "f;e", :null => false
      t.trsts
    end
  end

  def self.down
    drop_table :trst_hrs
  end
end
