#==Baza de date :Tabel => <em>trst_hrs</em>
#Tabelul care conţine evidenţa documentelor generate de sistem şi/sau utilizatori
#* Fişier migrare: <b><em>RAILS_ROOT/db/migrate/xxx_create_trst_hrs</em></b>
#    create_table "trst_hmrs_names", :force => true do |t|
#      t.string   "prefix",      :limit => 10, :default => "",  :null => false
#      t.string   "lstname",     :limit => 25, :default => "",  :null => false
#      t.string   "mdlname",     :limit => 25, :default => "",  :null => false
#      t.string   "frstname",    :limit => 25, :default => "",  :null => false
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

  def self.per_page
    20
  end

end
