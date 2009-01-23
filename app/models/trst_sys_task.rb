#==Baza de date :Tabel => <em>trst_sys_tasks</em>
#Tabelul care conţine acţiunile.
#* Fişier migrare: <b><em>RAILS_ROOT/db/migrate/xxx_create_trst_sys_tasks.rb</em></b>
#    create_table :trst_sys_tasks do |t|
#      t.integer "trst_sys_page_id", :limit => '6',        :default => 34,               :null => false
#      t.string "controller",        :limit => '15',       :default => 'info',           :null => false
#      t.string "exe_id",            :limit => '6',        :default => '...?...',        :null => false
#      t.string "exe_params",        :limit => '40',       :default => '...?...',        :null => false
#      t.string "name",              :limit => '15',       :default => '...?...',        :null => false
#      t.text "title",                                     :default => '...?...',        :null => false
#      t.text "info",                                      :default => '...?...',        :null => false
#      t.trsts
#    end
#În afara de câmpurile de mai sus se generează automat câmpul <b><em>t.integer "id"</em></b> de tip autoincrement,
#care de fapt reprezintă indexul tabelului.
#Linia <b><em>t.trsts</em></b> generează câmpurile implicite, prezente în fiecare tabel al aplicaţiei
#(vezi. clasa ActiveRecord::ConnectionAdapters::TableDefinition).
#==Descrierea câmpurilor:
#trst_page_id
# Pagina la care este alocată în mod general
#controller
# Controllerul invocat
#action
# Acţiunea din cadrul controllerului care va fi executată
#name
# Denumirea, de fapt numele link-ului
#title
# pagina
#info
# boolean
#==Relaţia cu alte tabele
#de tipul "habtm" (HasAndBelongsToMany), polimorfice etc... vezi => TrstSysPage
# belongs_to :trst_sys_pages
#==Rolul tabelului
#Descriere ....
class TrstSysTask < ActiveRecord::Base
  belongs_to :trst_sys_page

  def self.per_page
    20
  end

  def autosize
    self.exe_params.split(',')[1]
  end

  def width
    self.exe_params.split(',')[0].split('x')[0]
  end

  def height
    self.exe_params.split(',')[0].split('x')[1]
  end
end
