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
  
  #TODO de formulat
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
