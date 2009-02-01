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
    content = object_name.send(method)
    content_tag(:td, content, options)
  end

  def td_label_tag(object_name,method, text = nil, options = {})
    obj = object_name_is(object_name,options)
    options.delete(:object)
    options[:title] = t('tasks.' + obj.to_s.gsub(/trst/,"db") + '.list.' + method.to_s)
    text = t('tasks.' + obj.to_s.gsub(/trst/,"db") + '.list.' + method.to_s) if text.nil? || text.blank?
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
    
  def text_field(object_name,method, options = {})
    options[:size] = options["maxlength"] unless options[:size]
    options[:type] = "text"
    options[:value] ||= options[:object].send(method)
    options[:id] = "#{object_name}_#{method}"
    options[:name] = "#{object_name}[#{method}]"
    options.delete(:object)
    tag(:input, options)
  end

  def hidden_fields(object_name, fields = {})
    options = Hash.new
    options[:type] = "hidden"
    html ="<tr><td  colspan='2'>"
    fields.each_pair { |key,value|
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
      options[:colspan] = 10 unless options[:colspan]
      last_row_for_list(object_name, options)
    when :row20
      last_row_for_row20(object_name, options)
    end
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
        #{image_tag 'db_new.png',
    :alt => t('activerecord.attributes.crud.new'),
    :title => t('activerecord.attributes.crud.new'),
    :size => "18x18",
    :style => "padding : 0 0 0 10px; cursor : pointer; vertical-align : middle;",
    :onclick => "TrstWindow.edit(#{params[:id]},'new'); return false;"}
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

  def link_to_task_last_column(object_name)
    "<td align='center' style='border-left : 1px ridge #ffffff; width : 50px'>
    #{image_tag 'db_edit.png',
      :alt => t('activerecord.attributes.crud.edit'),
      :title => t('activerecord.attributes.crud.edit'),
      :size => "13x13",
      :style => "cursor : pointer; vertical-align : middle;",
      :onclick => "TrstWindow.edit(#{params[:id]}, #{object_name.id}); return false;"}
    #{image_tag 'db_info.png',
      :alt => t('activerecord.attributes.crud.show'),
      :title => t('activerecord.attributes.crud.show'),
      :size => "13x13",
      :style => "cursor : pointer; vertical-align : middle;",
      :onclick => "TrstWindow.show(#{params[:id]}, #{object_name.id}); return false;"}
    #{image_tag 'db_delete.png',
      :alt => t('activerecord.attributes.crud.remove'),
      :title => t('activerecord.attributes.crud.remove'),
      :size => "13x13",
      :style => "cursor : pointer; vertical-align : middle;",
      :onclick => "TrstWindow.remove(#{params[:id]}, #{object_name.id}); return false;"}
    </td>"
  end

  def image_for_link_to_task
    
  end

end
