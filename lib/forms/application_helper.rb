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
  
  #TODO text not nil or blank
  def th_label_tag(object_name,method, text = nil, options = {})
    obj = object_name_is(object_name,options)
    case options[:attributes]
    when 'label_attribute'
      options.delete(:attributes)
      text = t('activerecord.attributes.label_attribute')
    when 'label_value'
      options.delete(:attributes)
      text = t('activerecord.attributes.label_value')
    else
      options[:title] = t('tasks.' + obj.to_s.gsub(/trst/,"db") + '.list.' + method.to_s)
      text =  obj.classify.constantize.human_attribute_name("#{method}")
    end
    options.delete(:object)
    content_tag(:th, text, options)
  end

  def td_value_tag(object_name,method, options = {})
    obj = object_name_is(object_name,options)
    options[:title] = t('tasks.' + obj.to_s.gsub(/trst/,"db") + '.list.' + method.to_s)
    text = object_name.send(method)
    content_tag(:td, text, options)
  end

  def td_label_tag(object_name,method, text = nil, options = {})
    obj = object_name_is(object_name,options)
    options.delete(:object)
    options[:title] = t('tasks.' + obj.to_s.gsub(/trst/,"db") + '.list.' + method.to_s)
    text = t('tasks.' + obj.to_s.gsub(/trst/,"db") + '.list.' + method.to_s) if text.nil? || text.blank?
    content_tag(:td, text, options)
  end

  def td_text_field(object_name,method, options = {})
  end
    
  def text_field(object_name,method, options = {})
    options[:size] = options["maxlength"] unless options[:size]
    options[:type] = "text"
    options[:value] ||= options[:object].send(method)
    options[:id] = "#{object_name}_#{method}"
    options[:name] = "#{object_name}[#{method}]"
    options.delete(:object)
    tag(:input, options)
  end

  private
  
  def object_name_is(object_name,options)
    case object_name
    when String, Symbol
      ActionController::RecordIdentifier.singular_class_name(options[:object])
    when WillPaginate::Collection
      ActionController::RecordIdentifier.singular_class_name(object_name[0])
    when ActiveRecord::Base
      ActionController::RecordIdentifier.singular_class_name(object_name)
    else
      object_name
    end
  end

end
