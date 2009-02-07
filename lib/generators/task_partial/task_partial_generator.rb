class TaskPartialGenerator < Rails::Generator::Base
  default_options :single => false, :create => false, :controller_path => "trst_sys"
  def initialize(runtime_args, runtime_options = {})
    super
    I18n.load_path=(File.join(spec.path, 'messages.yml'))
    usage if args.empty?
    @name = args.shift
    @message = usage_message
    msg(@name)
    print @message
    print I18n.t("continue")
    r = gets
    exit unless r == 'y' || r == "d"
  end

  def manifest
    record do |m|
      #      if options[:single]
      #        m.directory File.join("app/views/#{options[:controller_path]}",task_path[0,task_path.rindex(/\//)])
      #        m.template(
      #          "single.html.erb",
      #          File.join("app/views/#{options[:controller_path]}",task_path[0,task_path.rindex(/\//)],"_#{single_file_name}.html.erb"))
      #      else
      #        m.directory File.join("app/views/#{options[:controller_path]}",task_path)
      #        for action in task_views
      #          m.template(
      #            "#{action}.html.erb",
      #            File.join("app/views/#{options[:controller_path]}", task_path, "_#{action}.html.erb")
      #          )
      #        end
      #      end
    end
  end

  private
  
  def usage_message
    File.exists?(File.join(spec.path, "USAGE_#{I18n.default_locale.to_s.upcase}")) ?
    File.read(File.join(spec.path, "USAGE_#{I18n.default_locale.to_s.upcase}")) :
    File.read(File.join(spec.path, "USAGE"))
  end

  def task_exists?(name)
    TrstSysTask.exists?(:exe_id => name)
  end

  def inflect_names(name)
    camel  = name.camelize
    under  = camel.underscore
    plural = under.pluralize
    singular = under.singularize
    [camel, under, plural, singular]
  end

  def msg(name)
    if task_exists?(name)
      message("msg1",name)
    elsif task_exists?(name.split('_').last) && name.split('_').length > 1
      name.classify.constantize.table_exists? ? message("msg2",name) : message("msg3",name) rescue message("msg4",name)
    else
      message("msg5",name)
    end
  end

  def prefix(name)
    ary = name.split('_')
    ary.pop
    prefix = options[:prefix]
    prefix ||= ary.last unless ary.last == "trst"
    prefix ||= "sys"
  end

  def add_options!(opt)
    opt.separator ''
    opt.separator 'Options:'
    opt.on("--single",
      "Generate only one partial") { |v| options[:single] = v }
    opt.on("--create",
      "Force creating partials even without required task") { |v| options[:create] = v }
    opt.on("--controller_path=name",
      "Change default ('trst_sys') controller") { |v| options[:controller_path] = v }
    opt.on("--prefix=name",
      "Change default ('sys') prefix") { |v| options[:prefix] = v }
  end

  def banner
    "Usage: #{$0} task_partial some_task_exe_id"
  end

  def message (msg,name)
    camel, under, plural, singular = inflect_names(name)
    @message << I18n.t(msg, :class_name => camel, :table_name => plural, :task_name => singular.last, :prefix => prefix(under))
  end

end