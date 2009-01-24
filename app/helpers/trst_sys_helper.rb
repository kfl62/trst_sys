module TrstSysHelper
  
  # Caută în baza de date acţiunile aferente paginii
  def current_tasks
    current_tasks = TrstSysTask.find(:all,:conditions => ['trst_sys_page_id = ?',current_page])
    return current_tasks
  end

  # Caută în baza de date acţiunea accesată ptr. afişarea descrierii acţiunii (info)
  # respectiv ptr. detalii privind executarea lui (exe)
  def current_task_todo(id)
    task = TrstSysTask.find(id)
    return task
  end

  # TODO de formulat
  def trst_find_all(arg1,arg2 = true)
    if arg2
      arg1.paginate :page => params[:page]
    else
      arg1.find(:all)
    end
  end
  
  # TODO de formulat
  def find_obj(arg1,arg2)
    arg1.find(arg2)
  end
  
  # TODO de formulat
  def save_obj(arg1,arg2,arg3)
    if arg2 == "new"
      obj = arg1.new
      obj.update_attributes(arg3)
    else
      obj = arg1.find(arg2)
      obj.update_attributes(arg3)
    end
  end

  # TODO de formulat
  def trst_paginate(arg1,arg2 = true)
    if arg2
      html = ' '
      html += link_to_remote('&nbsp;&laquo;&nbsp;',
        :url => { :action => 'task', :id => params[:id], :type => 'page', :page => '1'},
        :html => {:title => t('activerecord.attributes.paginate.first')}
      ) if arg1.current_page > 1
      html += link_to_remote('&nbsp;&lsaquo;&nbsp;',
        :url => { :action => 'task', :id => params[:id], :type => 'page', :page => (arg1.total_pages-1).to_s},
        :html => {:title => t('activerecord.attributes.paginate.prev')}
      ) if arg1.current_page > 2
      html += '<span style="font-size:0.9em"> pg. <strong>'+ arg1.current_page.to_s + '</strong> din ' + '<strong>' + arg1.total_pages.to_s + '</strong> </span>' if arg1.total_pages >1
      html += link_to_remote('&nbsp;&rsaquo;&nbsp;',
        :url => { :action => 'task', :id => params[:id], :type => 'page', :page => arg1.next_page},
        :html => {:title => t('activerecord.attributes.paginate.next')}
      ) if arg1.current_page < arg1.total_pages - 1
      html += link_to_remote('&nbsp;&raquo;&nbsp;',
        :url => { :action => 'task', :id => params[:id], :type => 'page', :page => arg1.total_pages},
        :html => {:title => t('activerecord.attributes.paginate.last')}
      ) if arg1.current_page < arg1.total_pages
    else
      html = " "
    end
    return html
  end

  # TODO de formulat
  def tdy
    dt = Date.today
    if dt.leap?
      dylft = 366 - dt.yday
    else
      dylft = 365 - dt.yday
    end
    return t('pages.pg34.tdy', :dt_long => l(dt, :format => 'long_trst'), :dt_week => dt.cweek, :dt_yday => dt.yday, :dt_dylft => dylft)
  end

end
