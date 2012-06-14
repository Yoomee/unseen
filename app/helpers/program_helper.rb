module ProgramHelper
  def add_to_program_link(event, options ={})
    options.merge!(
      :remote => true,
      :'data-event-id' => event.id
    )
    options[:class] ||= ""
    options[:class] += " pull-left" unless options[:class] =~ /pull-right/
    if current_user && current_user.events.include?(event)
      url = remove_event_path(event)
      options[:method] = :delete
      options[:title] = "Remove from my program"
      options[:class] += " white-btn add-to-program add-to-program-active"
    else
      url = add_event_path(event)
      options[:method] = :post
      options[:title] = "Add to my program"
      options[:class] += " white-btn add-to-program"
    end
    link_to "I'm going", url, options
  end
end