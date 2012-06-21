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
      options[:title] = "Remove from my programme"
      options[:class] += " white-btn add-to-program add-to-program-active"
    else
      url = add_event_path(event)
      options[:method] = :post
      options[:title] = "Add to my programme"
      options[:class] += " white-btn add-to-program"
    end
    link_to "I'm going", url, options
  end
  
  def venues_and_galleries_options(event)
    grouped_options_for_select(
      [
        ['Venues',    Page.find_by_slug('venues').children.order(:title).map{|p|[p.title,p.id]}],
        ['Galleries', Page.find_by_slug('galleries').children.order(:title).map{|p|[p.title,p.id]}]
      ],
      event.venue_id
    )
  end
end