# To change this template, choose Tools | Templates
# and open the template in the editor
ActionView::Base.class_eval do
  def self.default_form_builder
    Forms::ApplicationFormBuilder
  end
end