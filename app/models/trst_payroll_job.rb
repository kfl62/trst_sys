#==Baza de date :Tabel => <em>trst_payroll_jobs</em>
#Tabelul care conţine nomenclatorul ocupaţiilor din România
#* Fişier migrare: <b><em>RAILS_ROOT/db/migrate/xxx_create_trst_payroll_jobs</em></b>
#    create_table "trst_payroll_jobs", :force => true do |t|
#      t.string   "jobID",       :limit => 6
#      t.string   "descript",    :limit => 100
#      t.trst
#    end
#În afara de câmpurile de mai sus se generează automat câmpul <b><em>t.integer "id"</em></b> de tip autoincrement,
#care de fapt reprezintă indexul tabelului.
#Linia <b><em>t.trsts</em></b> generează câmpurile implicite, prezente în fiecare tabel al aplicaţiei
#(vezi. clasa ActiveRecord::ConnectionAdapters::TableDefinition).
#==Descrierea câmpurilor:
#Câmp
# Descriere
#==Relaţia cu alte tabele
#de tipul "habtm" (HasAndBelongsToMany), polimorfice etc...
#
# Dacă este cazul ... :)
#==Rolul tabelului
#Descriere ....

class TrstPayrollJob < ActiveRecord::Base
end
