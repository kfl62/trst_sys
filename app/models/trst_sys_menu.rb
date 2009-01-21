#==Baza de date :Tabel => <em>trst_sys_menus</em>
#Tabelul care conţine elementele "Meniului principal".
#* Fişier migrare: <b><em>RAILS_ROOT/db/migrate/xxx_create_trst_sys_menus.rb</em></b>
#    create_table :trst_sys_menus do |t|
#      t.string "name",            :limit => '15',     :default => 'Menu',     :null => false
#      t.string "controller",      :limit => '15',     :default => 'pub',      :null => false
#      t.string "chapter",         :limit => '2',      :default => '01',       :null => false
#      t.string "page",            :limit => '2',      :default => '01',       :null => false
#      t.boolean "has_submenu",                        :default => true,       :null => false
#      t.string "title",           :limit => '25',     :default => '...?...',  :null => false
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
# Controllerul invocat
#chapter
# Capitolul accesat
#page
# Pagina afişată în momentul accesării
#has_submenu
# Are submeniu? boolean
#title
# Titlul paginii (tooltip).
#==Relaţia cu alte tabele
#de tipul "habtm" (HasAndBelongsToMany), polimorfice etc...  vezi => TrstSysSubmenu
#  has_many :trst_sys_submenus
#==Rolul tabelului
#Descriere ....
#--
#==Generare meniu
#Fişierul care generază meniul este defapt un parţial <b>RAILS_ROOT/app/views/shared/_nav_main.html.erb</b>
#   <ul id="nav_main_list">
#     <% for m in menu %>
#     <li>
#       <%= link_to_remote(as_(m.name), {
#          :url=> {:controller => m.controller, :action => m.action, :chapter => m.chapter, :page => m.page, :has_submenu => m.has_submenu },
#          :loading => "$('flash-loading').show()",
#          :complete => "$('flash-loading').hide()"
#            },
#            :title => m.title
#        ) %>
#     </li>
#     <% end -%>
#   </ul>
#care la rândul lui este invocat de template-ul implicit
class TrstSysMenu < ActiveRecord::Base
  has_many :trst_sys_submenus

  def self.per_page
    20
  end
  
end
