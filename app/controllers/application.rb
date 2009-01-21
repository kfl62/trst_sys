# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  filter_parameter_logging :password, :password_confirmation
  helper_method :current_trst_user_session, :current_trst_user


  private
  def current_trst_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = TrstUserSession.find
  end

  def current_trst_user
    return @current_trst_user if defined?(@current_trst_user)
    @current_trst_user = current_trst_user_session && current_trst_user_session.trst_user
  end

  def require_user
    unless current_trst_user
      store_location
      flash[:notice] = t('login.flash.require_user')
      redirect_to :controller => '/trst_public', :action => 'index'
      return false
    end
  end

  def require_no_user
    if current_trst_user
      store_location
      flash[:notice] = t('login.flash.require_no_user')
      redirect_to account_url
      return false
    end
  end

  def store_location
    session[:return_to] = request.request_uri
  end

  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end

end
