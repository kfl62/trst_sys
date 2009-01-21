class TrstUserSessionsController < ApplicationController

  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy

  def new
    @trst_user_session = TrstUserSession.new
  end

  def create
    @trst_user_session = TrstUserSession.new(params[:trst_user_session])
    if @trst_user_session.save
      flash[:notice] = t('login.flash.logged_in')
      redirect_back_or_default('/trst_sys')
    else
      flash[:error] = t('login.flash.error')
      redirect_to :controller => '/trst_public', :action => 'index'
    end
  end

  def destroy
    current_trst_user_session.destroy
    flash[:notice] = t('login.flash.logged_out')
    redirect_back_or_default('/trst_public')
  end

end
