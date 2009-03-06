class CreateTrstHrPdts < ActiveRecord::Migration
  def self.up
    create_table :trst_hr_pdts do |t|
      t.integer  "trst_hr_id",        :limit => 6,  :default => 0,                     :null => false
      t.string   "CNP",               :limit => 14, :default => "",                    :null => false
      t.string   "BI_sr",             :limit => 2,  :default => "",                    :null => false
      t.string   "BI_nr",             :limit => 10, :default => "",                    :null => false
      t.string   "BI_elib",           :limit => 25, :default => "Pol.Mun.",            :null => false
      t.datetime "BI_date",                         :default => '1980-01-01 00:00:00'
      t.string   "PS_nr",             :limit => 10
      t.string   "PS_sr",             :limit => 2
      t.string   "PS_elib",           :limit => 25
      t.datetime "PS_date",                         :default => '1980-01-01 00:00:00'
      t.string   "cttn",              :limit => 10, :default => "ROMANA",              :null => false
      t.string   "addr_strt",         :limit => 50, :default => "str.",                :null => false
      t.string   "addr_city",         :limit => 50, :default => "",                    :null => false
      t.string   "addr_state",        :limit => 2,  :default => "",                    :null => false
      t.string   "addr_zip",          :limit => 10, :default => "",                    :null => false
      t.string   "tel",               :limit => 20
      t.string   "fax",               :limit => 20
      t.string   "mob",               :limit => 20
      t.string   "email",             :limit => 50
      t.string   "web",               :limit => 50
      t.trsts
    end
  end

  def self.down
    drop_table :trst_hr_pdts
  end
end
