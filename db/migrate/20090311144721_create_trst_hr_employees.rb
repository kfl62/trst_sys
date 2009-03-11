class CreateTrstHrEmployees < ActiveRecord::Migration
  def self.up
    create_table :trst_hr_employees do |t|
      t.integer  "trst_hr_id",          :limit => 6,   :default => 0,                     :null => false
      t.integer  "trst_firm_id",        :limit => 6,   :default => 1,                     :null => false
      t.integer  "trst_payroll_job_id", :limit => 6,   :default => 3631,                  :null => false
      t.string   "CIM_id",              :limit => 4,   :default => "0",                   :null => false
      t.datetime "CIM_date",                           :default => '1980-01-01 00:00:00'
      t.string   "ITM_id",              :limit => 8,   :default => "0",                   :null => false
      t.datetime "ITM_date",                           :default => '1980-01-01 00:00:00'
      t.string   "PM_sr",               :limit => 2,   :default => "",                    :null => false
      t.string   "PM_nr",               :limit => 10,  :default => "",                    :null => false
      t.datetime "PM_date",                            :default => '1980-01-01 00:00:00'
      t.string   "CIM_obiect",          :limit => 250, :default => "",                    :null => false
      t.boolean  "CIM_durata",                         :default => false,                 :null => false
      t.datetime "CIM_start",                          :default => '1980-01-01 00:00:00'
      t.datetime "CIM_end",                            :default => '1980-01-01 00:00:00'
      t.boolean  "pe",                                 :default => false,                 :null => false
      t.boolean  "ded",                                :default => false,                 :null => false
      t.string   "wrkh_day",            :limit => 2,   :default => "8",                   :null => false
      t.string   "wrkh_week",           :limit => 2,   :default => "40",                  :null => false
      t.string   "wrkh_day_1",          :limit => 2,   :default => "0",                   :null => false
      t.string   "wrkh_week_1",         :limit => 2,   :default => "0",                   :null => false
      t.string   "CO_days",             :limit => 2,   :default => "21",                  :null => false
      t.string   "CO_dayss",            :limit => 2,   :default => "0",                   :null => false
      t.integer  "slry_month",          :limit => 4,   :default => 500,                   :null => false
      t.integer  "slry_2a",             :limit => 4,   :default => 0,                     :null => false
      t.integer  "slry_2b",             :limit => 5,   :default => 0,                     :null => false
      t.integer  "slry_2c",             :limit => 4,   :default => 0,                     :null => false
      t.string   "slry_pdays",          :limit => 10,  :default => "2 si 17",             :null => false
      t.string   "drob_a",              :limit => 10,  :default => "",                    :null => false
      t.string   "drob_b",              :limit => 10,  :default => "",                    :null => false
      t.string   "drob_c",              :limit => 10,  :default => "",                    :null => false
      t.string   "drob_d",              :limit => 10,  :default => "",                    :null => false
      t.string   "drob_e",              :limit => 10,  :default => "",                    :null => false
      t.integer  "prd_prob",            :limit => 2,   :default => 5,                     :null => false
      t.integer  "prd_preavc",          :limit => 2,   :default => 15,                    :null => false
      t.integer  "prd_preavd",          :limit => 2,   :default => 15,                    :null => false
      t.string   "CCM",                 :limit => 10,  :default => "...",                 :null => false
      t.trsts
    end
  end

  def self.down
    drop_table :trst_hr_employees
  end
end
