#==Baza de date :Tabel => <em>trst_firmss</em>
#Tabelul care conţine datele firmelor proprii
#* Fişier migrare: <b><em>RAILS_ROOT/db/migrate/xxx_create_trst_firms</em></b>
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
#    t.string   "address",       :limit => 100, :default => "",    :null => false
#    t.string   "city",          :limit => 30,  :default => "",    :null => false
#    t.string   "zip",           :limit => 30,  :default => "",    :null => false
#    t.string   "state",         :limit => 30,  :default => "",    :null => false
#    t.string   "tel",           :limit => 30,  :default => "",    :null => false
#    t.string   "fax",           :limit => 30,  :default => "",    :null => false
#    t.string   "email",         :limit => 30,  :default => "",    :null => false
#    t.string   "webaddress",    :limit => 30,  :default => "",    :null => false
#    t.integer  "manager_id",    :limit => 6,   :default => 0,     :null => false
#    t.text     "mission",                      :default => ".?.", :null => false
#    t.text     "objectives",                   :default => ".?.", :null => false
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

class TrstFirm < ActiveRecord::Base
  belongs_to :trst_hr, :foreign_key => 'manager_id'
  has_many :trst_hr_employee

  def self.per_page
    20
  end

  def full_name
    prefix = self.prefix? ? self.prefix : 'S.C. ?'
    name = self.name? ? self.name : '...?...'
    suffix = self.suffix? ? self.suffix : 'S.R.L. ?'
    return prefix + ' ' + name + ' ' + suffix
  end

  def id_info
    chamcom = self.id_chamcom? ? self.id_chamcom : 'J12/.../....'
    fiscal = self.id_fiscal? ? self.id_fiscal : 'R...'
    itm = self.id_itm? ? self.id_itm : '...?...'
    account = self.id_account? ? self.id_account : '...?...'
    return chamcom + '; ' + fiscal + '; ' + itm + '; ' + account
  end

  def address_info
    address = self.address? ? self.address : 'str. ?'
    city = self.city? ? self.city : '...?...'
    zip = self.zip? ? self.zip : '...?...'
    state = self.state? ? self.state : '...?...'
    return address + ', ' + city + ', ' + zip + ', ' + state
  end

  def contact_info
    tel = self.tel? ? self.tel : '...?...'
    fax = self.fax? ? self.fax : '...?...'
    email = self.email? ? self.email : '...?...'
    web = self.webaddress? ? self.webaddress : '...?...'
    return tel + ' ' + fax + ' ' + email + ' ' + web
  end

end
