class TrstUserSessionsController < ApplicationController

  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy

  def new
    @trst_user_session = TrstUserSession.new
  end

  def create
    @trst_user_session = TrstUserSession.new(params[:trst_user_session])
    if @trst_user_session.save
      flash[:notice] = "Logged in successfully!"
      redirect_back_or_default('/trst_sys')
    else
      flash[:error] = "Something wrong ... Unsuccessfull authentication !!!"
      redirect_to :controller => '/trst_public', :action => 'index'
    end
  end

  def destroy
    current_trst_user_session.destroy
    flash[:notice] = "Logged out successfully!"
    redirect_back_or_default('/trst_public')
  end

end
