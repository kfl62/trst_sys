class Forms::ApplicationFormBuilder < ActionView::Helpers::FormBuilder
  # Copied from FormBuilder. FormBuilder looks like it has some bright
  # engineering ideas but never finished implementing them. This *should*
  # be automated by defining "self.field_helpers", but it's used before
  # this class is loaded.
  Forms::ApplicationHelper.instance_methods.each do |selector|
    src = <<-end_src
        def #{selector}(method, options = {})
          @template.send(#{selector.inspect}, @object_name, method, objectify_options(options))
        end
    end_src
    class_eval src, __FILE__, __LINE__
    
    def label(method, text = nil, options = {})
      @template.label(@object_name, method, text, objectify_options(options))
    end
    def th_label_tag(method, text = nil, options = {})
      @template.th_label_tag(@object_name, method, text, objectify_options(options))
    end
    def td_value_tag(method, options = {})
      @template.td_value_tag(@object_name, method, objectify_options(options))
    end
    def td_label_tag(method, text = nil, options = {})
      @template.td_label_tag(@object_name, method, text, objectify_options(options))
    end
    def td_text_field(method, options = {})
      @template.td_text_field(@object_name, method, objectify_options(options))
    end
    def text_field(method, options = {})
      @template.text_field(@object_name, method, objectify_options(options))
    end
  end

  private

  def objectify_options(options)
    @default_options.merge(options.merge(:object => @object))
  end
end
