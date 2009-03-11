class CreateTrstPayrollJobs < ActiveRecord::Migration
  def self.up
    create_table :trst_payroll_jobs do |t|
      t.string "jobID",    :limit => 6
      t.string "descript", :limit => 100
      t.trsts
    end
  end

  def self.down
    drop_table :trst_payroll_jobs
  end
end
