#==Baza de date :Tabel => <em>trst_hrs</em>
#Tabelul care conţine evidenţa documentelor generate de sistem şi/sau utilizatori
#* Fişier migrare: <b><em>RAILS_ROOT/db/migrate/xxx_create_trst_hrs</em></b>
#    create_table "trst_hmrs_names", :force => true do |t|
#      t.string   "prefix",      :limit => 10, :default => "",  :null => false
#      t.string   "frst_name",   :limit => 25, :default => "",  :null => false
#      t.string   "mdl_name",    :limit => 25, :default => "",  :null => false
#      t.string   "lst_name",    :limit => 25, :default => "",  :null => false
#      t.string   "stts",        :limit => 1,  :default => "1", :null => false
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
class TrstHr < ActiveRecord::Base
  has_one :trst_hr_pdt
  
  def self.per_page
    20
  end

  def full_name
    r = self.prefix? ? self.prefix + ' ' : ''
    r += self.frst_name
    r += ('-' + self.mdl_name) unless self.mdl_name.nil? || self.mdl_name.empty?
    r += ' ' + self.lst_name
  end

end
