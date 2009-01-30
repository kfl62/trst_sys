#==Baza de date :Tabel => <em>trst_prtns</em>
#Tabelul care conţine evidenţa documentelor generate de sistem şi/sau utilizatori
#* Fişier migrare: <b><em>RAILS_ROOT/db/migrate/xxx_create_trst_prtns</em></b>
#  create_table "trst_prtns", :force => true do |t|
#    t.string   "prefix",        :limit => 10,  :default => "",    :null => false
#    t.string   "name",          :limit => 100, :default => "",    :null => false
#    t.string   "suffix",        :limit => 10,  :default => "",    :null => false
#    t.string   "namesh",        :limit => 10,  :default => "",    :null => false
#    t.string   "id_chamcom",    :limit => 25,  :default => "",    :null => false
#    t.string   "id_fiscal",     :limit => 15,  :default => "",    :null => false
#    t.string   "id_itm",        :limit => 15,  :default => "",    :null => false
#    t.string   "id_account",    :limit => 15,  :default => "",    :null => false
#    t.string   "id_internet",   :limit => 15,  :default => "",    :null => false
#    t.string   "adress",        :limit => 100, :default => "",    :null => false
#    t.string   "city",          :limit => 30,  :default => "",    :null => false
#    t.string   "zip",           :limit => 30,  :default => "",    :null => false
#    t.string   "state",         :limit => 30,  :default => "",    :null => false
#    t.integer  "id_country",    :limit => 4,   :default => 0,     :null => false
#    t.string   "contactpers",   :limit => 30,  :default => "",    :null => false
#    t.string   "contactpers_q", :limit => 25,  :default => "",    :null => false
#    t.string   "tel",           :limit => 30,  :default => "",    :null => false
#    t.string   "fax",           :limit => 30,  :default => "",    :null => false
#    t.string   "email",         :limit => 30,  :default => "",    :null => false
#    t.string   "webadress",     :limit => 30,  :default => "",    :null => false
#    t.boolean  "flag_clb",                     :default => false, :null => false
#    t.trst
#  end
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

class TrstPrtn < ActiveRecord::Base

  def self.per_page
    20
  end

  def name_long
    prefix = self.prefix? ? self.prefix : 'S.C. ?'
    name = self.name? ? self.name : '...?...'
    suffix = self.suffix? ? self.suffix : 'S.R.L. ?'
    return prefix + ' ' + name + ' ' + suffix
  end

end