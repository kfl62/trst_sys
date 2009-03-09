module Forms::ApplicationHelper
  
  def label(object_name,method, text = nil, options = {})
    obj = object_name_is(object_name,options)
    if options[:short_name]
      options.delete(:short_name)
      text ||= obj.classify.constantize.human_attribute_name("#{method}")
    else
      text ||= t('tasks.' + obj.to_s.gsub(/trst/,"db") + '.list.' + method.to_s)
    end
    options.delete(:object)
    options["name"] ||= "#{object_name}_#{method}"
    options["name"] ||= "#{obj}_#{method}" if  object_name.is_a? Object
    content_tag(:label, text , options)
  end
  
  def th_label_tag(object_name,method, text = nil, options = {})
    obj = object_name_is(object_name,options)
    text ||= t('activerecord.attributes.' + options.delete(:attributes)) if options.has_key?(:attributes)
    text ||=  obj.classify.constantize.human_attribute_name("#{method}")
    options[:title] = options.has_key?(:attributes) ? "" : t('tasks.' + obj.to_s.gsub(/trst/,"db") + '.list.' + method.to_s)
    options.delete(:object)
    content_tag(:th, text, options)
  end

  def td_value_tag(object_name,method, options = {})
    obj = object_name_is(object_name,options)
    options[:title] = t('tasks.' + obj.to_s.gsub(/trst/,"db") + '.list.' + method.to_s)
    content = object_name.send(method)
    content_tag(:td, content, options)
  end

  def td_label_tag(object_name,method, text = nil, options = {})
    obj = object_name_is(object_name,options)
    options.delete(:object)
    options[:title] = t('tasks.' + obj.to_s.gsub(/trst/,"db") + '.list.' + method.to_s)
    text ||= t('tasks.' + obj.to_s.gsub(/trst/,"db") + '.list.' + method.to_s)
    content_tag(:td, text, options)
  end

  def td_text_field(object_name,method, options = {})
    options[:value] ||= options[:object].send(method)
    options[:id] = "#{object_name}_#{method}"
    options[:name] = "#{object_name}[#{method}]"
    options.delete(:object)
    td_options = options[:td]
    options.delete(:td)
    "<td #{td_options}>#{tag(:input, options)}</td>"
  end

  def hidden_fields(object_name, fields = {})
    options = Hash.new
    options[:type] = "hidden"
    html ="<tr><td  colspan='2'>"
    fields.each_pair { |key,value|
      options[:id] = "#{object_name}_#{key}"
      options[:name] = "#{object_name}[#{key}]"
      options[:value] = "#{value}"
      html += tag(:input, options)
    }
    html += "</tr></td>"
  end

  def link_to_task(object_name,method, options = {})
    case method
    when :last_column
      link_to_task_last_column(object_name)
    end
  end

  def last_row_for(object_name,method, options = {})
    case method
    when :edit
      last_row_for_edit
    when :list
      options[:colspan] ||= 10
      last_row_for_list(object_name, options)
    when :row20
      last_row_for_row20(object_name, options)
    when :save
      last_row_for_save(object_name, options)
    when :show
      last_row_for_show(object_name, options)
    end
  end

  def td_auto_complete_search(object_name,method, options = {})
    html = '<td>'
    html += tag(:input, :id => 'auto_complete_search', :type => 'text')
    html += tag(:div, :id => 'auto_complete_search_result', :class => 'autocomplete')
    html += auto_complete_search(object_name,method, options)
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

  def last_row_for_edit
    "<tr>
      <td align='center' colspan='2' style ='padding-top:10px'>
        <input type='submit' value='#{t('activerecord.attributes.crud.save')}'/>
        <input type='button' value='#{t('activerecord.attributes.crud.cancel')}' onclick='Lightview.hide();return false'/>
      </td>
     </tr>
    "
  end

  def last_row_for_list(object_name, options)
    "<tr class='even'>
        <td colspan='#{options[:colspan]}'  align='center' style='padding-top:10px'>#{trst_paginate(object_name)}</td>
        <td style='border-left : 1px ridge #ffffff; width : 50px'>
        #{image_tag_for_link("edit", {:arg1 => params[:id], :arg2 => "'new'", :size => "18x18", :style => "padding : 0 0 0 10px; cursor : pointer; vertical-align : middle;" })}
        </td>
      </tr>
    "
  end

  def last_row_for_row20(object_name, options)
    html = ""
    if options[:offset].modulo(object_name.per_page) > 0
      (object_name.per_page-options[:offset].modulo(object_name.per_page)).times do
        html += "<tr class='even'>
            <td colspan='#{options[:colspan]}'>&nbsp;</td>
          </tr>"
      end
    end
    html
  end

  def last_row_for_save(object_name, options)
    text = object_name_is(object_name,options).to_s.gsub(/trst/,"db")
    html = "<tr>"
    html += "<td align='center' colspan='2' style='padding-top:10px'>"
    html += link_to_function t("tasks.#{text}.save.link_to_show"), "TrstWindow.show(#{params[:id]},#{params[:obj_id]})"
    html += "&nbsp;&nbsp;|&nbsp;&nbsp;"
    html += link_to_function t("tasks.#{text}.save.link_to_list"), "TrstWindow.exe(#{params[:id]},#{params[:obj_id]})"
    html += "</td>"
    html += "</tr>"
    html
  end

  def last_row_for_show(object_name, options)
    text = object_name_is(object_name,options).to_s.gsub(/trst/,"db")
    html = "<tr>"
    html += "<td align='center' colspan='2' style='padding-top:10px'>"
    html += link_to_function t("tasks.#{text}.show.link_to_edit"), "TrstWindow.edit(#{params[:id]},#{params[:obj_id]})"
    html += "&nbsp;&nbsp;|&nbsp;&nbsp;"
    html += link_to_function t("tasks.#{text}.show.link_to_list"), "TrstWindow.exe(#{params[:id]},#{params[:obj_id]})"
    html += "</td>"
    html += "</tr>"
    html
  end

  def link_to_task_last_column(object_name)
    "<td align='center' style='border-left : 1px ridge #ffffff; width : 50px'>
    #{image_tag_for_link("edit,show,remove", {:arg1 => params[:id], :arg2 => object_name.id })}
    </td>"
  end

  def image_tag_for_link(src,options ={})
    html = ""
    src.split(",").each { |s|
      options[:alt] = options[:title] = options[:arg2] == "'new'" ? t('activerecord.attributes.crud.new')  : t('activerecord.attributes.crud.' + s)
      options[:size] ||= "13x13"
      options[:style] ||= "cursor : pointer; vertical-align : middle;"
      options[:onclick] = "TrstWindow.#{s}(#{options[:arg1]}, #{options[:arg2]}); return false;"
      options[:onclick] = "if (confirm('#{t('activerecord.attributes.crud.remove_confirm')}')) {TrstWindow.#{s}(#{options[:arg1]}, #{options[:arg2]}); return false} else {return false;}" if s == "remove"
      img = options[:arg2] == "'new'" ? "db_new.png" : "db_#{s}.png"
      html += image_tag(img, options.dup.delete_if { |k,v|  k.to_s.include? "arg"})
    }
    html
  end

  def auto_complete_search(object_name,method, options = {})
    function = "new Ajax.Autocompleter("
    function << "'auto_complete_search', "
    function << "'auto_complete_search_result', "
    function << "'/trst_sys/auto_complete'"

    js_options = {}
    js_options[:parameters] = "'object=#{options[:search_object]}&method=#{options[:search_method]}'"
    js_options[:tokens] = array_or_string_for_javascript(options[:tokens]) if options[:tokens]
    js_options[:callback] = "function(element, value) { return #{options[:with]} }" if options[:with]
    js_options[:indicator] = "'#{options[:indicator]}'" if options[:indicator]
    js_options[:select] = "'#{options[:select]}'" if options[:select]
    js_options[:paramName] = options[:param_name] ? "'#{options[:param_name]}'" : "'search'"
    js_options[:frequency] = "#{options[:frequency]}" if options[:frequency]
    js_options[:method] = "'get'"
    js_options[:afterUpdateElement] = "updateHiddenField"

    { :on_show => :onShow, :on_hide => :onHide, :min_chars => :minChars }.each do |k,v|
      js_options[v] = options[k] if options[k]
    end

    function << (', ' + options_for_javascript(js_options) + ');')
    function << "function updateHiddenField(text, li) {"
    function << "$('#{object_name}_#{method}').value = li.id"
    function << "}"

    javascript_tag(function)
  end

end
