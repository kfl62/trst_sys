module Forms::ApplicationHelper

  def label(object_name,method, text = nil, options = {})
    obj = object_name_is(object_name,options)
    if options[:short_name]
      options.delete(:short_name)
      text = obj.classify.constantize.human_attribute_name("#{method}")
    else
      text = t('tasks.' + obj.to_s.gsub(/trst/,"db") + '.list.' + method.to_s)
    end if text.nil? || text.blank?
    options.delete(:object)
    options["name"] ||= "#{object_name}_#{method}"
    options["name"] ||= "#{obj}_#{method}" if  object_name.is_a? Object
    content_tag(:label, text , options)
  end

  private
  
  def object_name_is(object_name,options)
    case object_name
    when String, Symbol
      ActionController::RecordIdentifier.singular_class_name(options[:object])
    when Object
      ActionController::RecordIdentifier.singular_class_name(object_name)
    else
      object_name
    end
  end

end
