#==Baza de date :Tabel => <em>trst_hr_pdts</em>
#Tabelul care conţine evidenţa datelor personale (resurse umane)
#* Fişier migrare: <b><em>RAILS_ROOT/db/migrate/xxx_create_trst_hr_pdts</em></b>
#    create_table "trst_hmrs_pdts", :force => true do |t|
#      t.integer  "trst_hr_id",        :limit => 6,  :default => 0,                     :null => false
#      t.string   "CNP",               :limit => 14, :default => "",                    :null => false
#      t.string   "BI_sr",             :limit => 2,  :default => "",                    :null => false
#      t.string   "BI_nr",             :limit => 10, :default => "",                    :null => false
#      t.string   "BI_elib",           :limit => 25, :default => "Pol.Mun.",            :null => false
#      t.datetime "BI_date",                         :default => '1980-01-01 00:00:00'
#      t.string   "PS_nr",             :limit => 10
#      t.string   "PS_sr",             :limit => 2
#      t.string   "PS_elib",           :limit => 25
#      t.datetime "PS_date",                         :default => '1980-01-01 00:00:00'
#      t.string   "cttn",              :limit => 10, :default => "ROMANA",              :null => false
#      t.string   "addr_strt",         :limit => 50, :default => "str.",                :null => false
#      t.string   "addr_city",         :limit => 50, :default => "",                    :null => false
#      t.string   "addr_state",        :limit => 2,  :default => "",                    :null => false
#      t.string   "addr_zip",          :limit => 10, :default => "",                    :null => false
#      t.string   "tel",               :limit => 20
#      t.string   "fax",               :limit => 20
#      t.string   "mob",               :limit => 20
#      t.string   "email",             :limit => 50
#      t.string   "web",               :limit => 50
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
class TrstHrPdt < ActiveRecord::Base
  belongs_to :trst_hr
end
