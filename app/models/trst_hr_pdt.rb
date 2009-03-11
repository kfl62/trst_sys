#==Baza de date :Tabel => <em>trst_hr_pdts</em>
#Tabelul care conţine evidenţa datelor personale (resurse umane)
#* Fişier migrare: <b><em>RAILS_ROOT/db/migrate/xxx_create_trst_hr_pdts</em></b>
#    create_table "trst_hr_pdts", :force => true do |t|
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

  def self.per_page
    20
  end

  def hr_name
    "( " + self.trst_hr_id.to_s + " )  " + self.trst_hr.full_name
  end

  def bi_info
    "  BI  " + self.BI_sr + "." + self.BI_nr + " " + self.BI_elib + " " + I18n.l(self.BI_date, :format => 'date')
  end

  def ps_info
    "  PS  " + self.PS_sr + "." + self.PS_nr + " " + self.PS_elib + " " + I18n.l(self.PS_date, :format => 'date')
  end

  def adress_info
    self.addr_strt + " " + self.addr_city + " " + self.addr_state + " " + self.addr_zip
  end

  def contact_info
    self.tel + " ; " + self.fax + " ; " + self.mob + " ; " + self.email + " ; " + self.web
  end
  
end
