module TrstSysHelper
  
  # Caută în baza de date acţiunile aferente paginii
  def current_tasks
    current_tasks = TrstSysTask.find(:all,:conditions => ['trst_sys_page_id = ?',current_page])
    return current_tasks
  end

  # Caută în baza de date acţiunea accesată ptr. afişarea descrierii acţiunii (info)
  # respectiv ptr. detalii privind executarea lui (exe)
  def current_task(id)
    TrstSysTask.find(id)
  end

  def partial_path(arg1,arg2)
    base = "#{RAILS_ROOT}/app/views/trst_sys"
    prefix =  arg1.prefix.blank? ?  "" : "#{arg1.prefix}"
    name = "#{arg1.exe_id}.html.erb" if FileTest.exists?(File.join(base,prefix ,"_#{arg1.exe_id}.html.erb"))
    name ||= "#{arg1.exe_id}/#{arg2}.html.erb"
    partial_path = File.join("trst_sys",prefix,name)
    partial_path
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
