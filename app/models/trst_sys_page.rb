#==Baza de date :Tabel => <em>trst_sys_pages</em>
#Tabelul care conţine paginile.
#* Fişier migrare: <b><em>RAILS_ROOT/db/migrate/xxx_create_trst_sys_pages.rb</em></b>
#    create_table :trst_sys_pages do |t|
#      t.string "controller",      :limit => '15',     :default => 'pub',      :null => false
#      t.string "chapter",         :limit => '2',      :default => '01',       :null => false
#      t.string "page",            :limit => '2',      :default => '01',       :null => false
#      t.text "title",                                 :default => '...?...',  :null => false
#      t.text "intro",                                 :default => '...?...',  :null => false
#      t.text "actions",                               :default => '...?...',  :null => false
#      t.text "content",                               :default => '...?...',  :null => false
#      t.text "note",                                  :default => '...?...',  :null => false
#      t.trsts
#    end
#În afara de câmpurile de mai sus se generează automat câmpul <b><em>t.integer "id"</em></b> de tip autoincrement,
#care de fapt reprezintă indexul tabelului.
#Linia <b><em>t.trsts</em></b> generează câmpurile implicite, prezente în fiecare tabel al aplicaţiei
#(vezi. clasa ActiveRecord::ConnectionAdapters::TableDefinition).
#==Descrierea câmpurilor:
#controller
# controllerul invocat
#chapter
# capitolul
#page
# pagina
#title
# titlu
#intro
# Introducere
#actions
# ...?...
#content
# ...?...
#note
# ...?...
#==Relaţia cu alte tabele
#de tipul "habtm" (HasAndBelongsToMany), polimorfice etc...  vezi => TrstSysAction
#  has_many :trst_sys_actions
#==Rolul tabelului
#Descriere ....

class TrstSysPage < ActiveRecord::Base
  has_many :trst_sys_task

  def self.per_page
    20
  end

end
