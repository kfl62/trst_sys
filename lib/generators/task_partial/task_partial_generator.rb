class TaskPartialGenerator < Rails::Generator::NamedBase
  default_options :single => false, :create => false, :controller_path => "trst_sys"

  def initialize(runtime_args, runtime_options = {})
    super
    if TrstSysTask.find(:first, :conditions => ['exe_id = ?', @name ]).nil?
      logger.error("Task with exe_id='#{@name}' doesn't exists in trst_sys_tasks table !
        Create a new record in table with exe_id='#{@name}' and try again ...
        or run with --create_record (if you are sure you didn't misspelled)")
      exit
    end unless options[:create]
  end

  def manifest
    record do |m|
      if options[:single]
        m.directory File.join("app/views/#{options[:controller_path]}",task_path)
        m.template(
          "single.html.erb",
          File.join("app/views/#{options[:controller_path]}",task_path,"_#{single_file_name}.html.erb"))
      else
        m.directory File.join("app/views/#{options[:controller_path]}",task_path)
        for action in task_views
          m.template(
            "#{action}.html.erb",
            File.join("app/views/#{options[:controller_path]}", task_path, "_#{action}.html.erb")
          )
        end
      end
    end
  end

  private

  def banner
    "Usage: #{$0} task_partial some_task_exe_id"
  end
  
  def task_path
    file_name.gsub(/_/, "/")
  end

  def single_file_name
    file_name.split("_").last
  end

  def task_views
    %w[ edit list save show ]
  end

  def add_options!(opt)
    opt.separator ''
    opt.separator 'Options:'
    opt.on("--single",
      "Generate only one partial") { |v| options[:single] = v }
    opt.on("--create",
      "Force creating partials even without required task") { |v| options[:create] = v }
    opt.on("--controller_path",
      "Change default ('trst_sys') controller") { |v| options[:controller_path] = args[0] }
  end

end