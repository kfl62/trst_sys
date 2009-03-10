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

  def auto_complete
    find_options = {
      :conditions => [ "LOWER(#{params[:method]}) LIKE ?", '%' + params[:search].downcase + '%' ],
      :order => "#{params[:method]} ASC",
      :limit => 10 }
    @items = params[:object].constantize.find(:all,find_options )
    render :partial => "shared/auto_complete"
  end

end
