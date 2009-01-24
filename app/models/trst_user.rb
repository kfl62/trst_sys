class TrstUser < ActiveRecord::Base

  acts_as_authentic
  
  def self.per_page
    20
  end

  def full_name
    r = self.frst_name
    r += '-' + self.mdl_name unless self.mdl_name.nil?
    r += ' ' + self.lst_name
  end

end
