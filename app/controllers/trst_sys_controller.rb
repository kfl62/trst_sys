class TrstSysController < ApplicationController
  layout 'layouts/default'
  before_filter :require_user

  def index

  end
  
  def mce_edit
    render :layout => false
  end

  def sort_tasks
    params[:tasks].each_with_index do |id,index|
      TrstSysTask.update_all(['position=?', index+1],['id=?', id])
    end
    render :nothing => true
  end

end
