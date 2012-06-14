module ProgramHelper
  def add_to_program_link(event)
    options = {
      :remote => true,
      :'data-event-id' => event.id
    }
    if current_user && current_user.events.include?(event)
      url = remove_event_path(event)
      options[:method] = :delete
      options[:class] = 'white-btn add-to-program add-to-program-active'
      options[:title] = "Remove from my program"
    else
      url = add_event_path(event)
      options[:method] = :post
      options[:class] = 'white-btn add-to-program'
      options[:title] = "Add to my program"
    end
    link_to "I'm going", url, options
  end
end