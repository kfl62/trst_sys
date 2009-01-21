#==Baza de date :Tabel => <em>trst_sys_submenus</em>
#Tabelul care conţine elementele "Meniului secundar (Submeniu)".
#* Fişier migrare: <b><em>RAILS_ROOT/db/migrate/xxx_create_trst_sys_submenus.rb</em></b>
#    create_table :trst_sys_submenus do |t|
#      t.integer "trst_sys_menu_id",  :limit => '6',      :default => 1,          :null => false
#      t.string "name",               :limit => '15',     :default => 'Menu',     :null => false
#      t.string "controller",         :limit => '15',     :default => 'pub',      :null => false
#      t.string "chapter",            :limit => '2',      :default => '01',       :null => false
#      t.string "page",               :limit => '2',      :default => '01',       :null => false
#      t.boolean "active",                                :default => true,       :null => false
#      t.string "title",              :limit => '25',     :default => '...?...',  :null => false
#      t.trsts
#    end
#În afara de câmpurile de mai sus se generează automat câmpul <b><em>t.integer "id"</em></b> de tip autoincrement,
#care de fapt reprezintă indexul tabelului.
#Linia <b><em>t.trsts</em></b> generează câmpurile implicite, prezente în fiecare tabel al aplicaţiei
#(vezi. clasa ActiveRecord::ConnectionAdapters::TableDefinition).
#==Descrierea câmpurilor:
#name
# Denumirea care va apărea in bara de meniu
#controller
# Controller-ul invocat
#chapter
# Capitolul
#page
# Pagina
#active
# boolean
#title
# Titlu
#==Relaţia cu alte tabele
#de tipul "habtm" (HasAndBelongsToMany), polimorfice etc... vezi => TrstSysMenu
#  belongs_to :trst_sys_menu
#==Rolul tabelului
#Descriere ....
class TrstSysSubmenu < ActiveRecord::Base
  belongs_to :trst_sys_menu

  def self.per_page
    20
  end

end
