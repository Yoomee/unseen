module LinksHelper
  
  def link_if_allowed(*args, &block)
    options = args.extract_options!
    ability_or_resource = args[block_given? ? 0 : 1]
    if ability_or_resource.is_a?(Array)
      return "" unless can?(*ability_or_resource)
      if ability_or_resource[0].to_s == "destroy"
        args[block_given? ? 0 : 1] = ability_or_resource[1]
        options[:method] ||= :delete
      elsif !ability_or_resource[1].is_a?(ActiveRecord::Base)
        ability_or_resource[1] = ability_or_resource[1].to_s.underscore
      end
    else
      return "" unless can?(:read, ability_or_resource)
    end
    args << options
    link_to(*args, &block)
  end
  
end