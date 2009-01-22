class TrstUsersController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update]

  def new
    @trst_user = TrstUser.new
  end

  def create
    @trst_user = TrstUser.new(params[:trst_user])
    if @trst_user.save
      flash[:notice] = t('login.flash.user_create')
      redirect_back_or_default account_url
    else
      render :action => :new
    end
  end

  def show
    @trst_user = @current_trst_user
  end

  def edit
    @trst_user = @current_trst_user
  end

  def update
    @trst_user = @current_trst_user # makes our views "cleaner" and more consistent
    if @trst_user.update_attributes(params[:trst_user])
      flash[:notice] = t('login.flash.user_update')
      redirect_to account_url
    else
      render :action => :edit
    end
  end

end
