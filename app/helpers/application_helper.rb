# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  include Forms::ApplicationHelper
  # Caută în baza de date elementele  meniului principal
  def menu
    menu = TrstSysMenu.find(:all, :conditions => ['controller = ?', params[:controller]])
    return menu
  end
  # Caută în baza de date elementele submeniului aferent elementului ales din meniul principal
  def submenu
    submenu = TrstSysSubmenu.find(:all, :conditions => ['controller = ? AND chapter = ?', params[:controller], params[:chapter]])
    return submenu
  end

  # Verifică existenţa fişierului "surogat/de înlocuire" paginii aferente elementului ales
  def pg_file
    pg_file = "#{RAILS_ROOT}/config/locales/ro_RO/pages/" + controller.controller_name + '/pg_'+ params[:chapter] + '_' +params[:page] + '.html.erb'
    if FileTest.exists?(pg_file)
      return pg_file
    else
      return nil
    end
  end

  # Caută în baza de date pagina aferentă elementului ales
  def current_page
    current_page = TrstSysPage.find(:first,:conditions => ['controller = ? AND chapter = ? AND page = ?',params[:controller],params[:chapter],params[:page]])
    return current_page
  end
end
