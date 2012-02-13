module LayoutHelper
  
  def yield_with_bootstrap(yield_content, options = {})
    options.reverse_merge!(:container_class => "container-fluid", :row_class => "row-fluid", :span_class => "span12")
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
  
end