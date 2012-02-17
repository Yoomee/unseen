module LayoutHelper

  def yield_with_bootstrap(yield_content, options = {})
    options.reverse_merge!(:container_class => "container-fluid", :row_class => "row-fluid", :span_class => "span10")
    first_div_class = yield_content.match(/^<div\s+[^>]*class=[\"\']([^\"\']+)[\"\']/i).try(:[], 1).to_s
    if !first_div_class.match(/container/)
      if !first_div_class.match(/row/)
        if !first_div_class.match(/span/)
          yield_content = content_tag(:div, yield_content, :class => options[:span_class])
        end
        yield_content = content_tag(:div, yield_content, :class => options[:row_class])
      end
      yield_content = content_tag(:div, yield_content, :class => options[:container_class])
    end
    yield_content
  end
  
  def yield_with_span(yield_content, options = {})
    options.reverse_merge!(:span_class => "span10")
    first_div_class = yield_content.match(/^<div\s+[^>]*class=[\"\']([^\"\']+)[\"\']/i).try(:[], 1).to_s
    if !first_div_class.match(/span/)
      yield_content = content_tag(:div, yield_content, :class => options[:span_class])
    end
    yield_content
  end

  def body_tag(options = {}, &block)
    options[:id] ||= id_for_body_tag
    body_class = "#{classes_for_body_tag_string} #{options[:class]}".strip
    options[:class] = body_class unless body_class.blank?
    concat content_tag(:body, capture(&block), options)
  end

  def classes_for_body_tag_string
    classes_for_body_tag.join(' ')
  end

  def content_tag_with_active(*args, &block)
    options = args.extract_options!.symbolize_keys
    options ||= {}
    options[:class] = (options[:class].blank? ? "active" : options[:class] + " active") if args.second
    if block_given?
      content_tag(args.first, options, &block)
    else
      content_tag(args.first, args.third, options)
    end
  end

  def li_with_active(*args, &block)
    content_tag_with_active(:li, *args, &block)
  end

  private
  def id_for_body_tag
    is_home? ? 'home' : 'inside'
  end
  
  def is_home?
    @is_home || controller_name == "home"
  end

  def classes_for_body_tag
    [].tap do |classes|
      classes << case
      when @section && @section.is_a?(Section) && @section.id
        out = "section_#{@section.id}"
        @section.slug.blank? ? out : out + " section_#{@section.slug.downcase.fully_underscore}"
      when @page && @page.is_a?(Page)          
        out = "page_#{@page.id} section_#{@page.section_id}"
        out << " page_#{@page.slug.downcase.fully_underscore}" if !@page.slug.blank?
        @page.section_slug.blank? ? out : out + " section_#{@page.section_slug.downcase.fully_underscore}"
      end
      classes << "controller_#{controller_name}"
      classes << "action_#{action_name}"
      #classes << (logged_in_member ? 'logged_in' : 'logged_out')
    end
  end

end
