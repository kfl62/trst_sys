module WillPaginateHelper

  # TODO de formulat
  def trst_find_all(arg1,arg2 = true)
    if arg2
      arg1.paginate :page => params[:page]
    else
      arg1.find(:all)
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
        :url => { :action => 'task', :id => params[:id], :type => 'page', :page => (arg1.previous_page).to_s},
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

end
