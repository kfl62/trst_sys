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
  def find_obj(arg1,arg2)
    if arg2 == 'last'
      arg1.find(:last)
    else
      arg1.find(arg2)
    end
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

end
