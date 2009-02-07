class TrstUserTest < ActiveRecord::Base

  acts_as_authentic
  
  def self.per_page
    20
  end

  def full_name
    r = self.frst_name
    r += ('-' + self.mdl_name) unless self.mdl_name.nil? || self.mdl_name.empty?
    r += ' ' + self.lst_name
  end

end
