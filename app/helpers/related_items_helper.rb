module RelatedItemsHelper

  def events(page_event)
    events = page_event.related_events.first(page_event.number_of_related_events)
    events += Event.without(page_event.is_a?(Event) ? page_event : nil).without(page_event.related_events).where("date > ?", Date.new(2012,12,31)).tagged_with([page_event.page_tag_list, page_event.category_list].flatten, :any => true).uniq.first(page_event.number_of_related_events - page_event.related_events.count) if page_event.number_of_related_events - page_event.related_events.count > 0
    events
  end

  def other_stories(page_event)
    other_stories = page_event.related_pages.first(page_event.number_of_related_pages)
    other_stories += news_page.children.without(page_event.is_a?(Page) ? page_event : nil).without(page_event.related_pages).where(:edition => page_event.edition).tagged_with([page_event.page_tag_list, page_event.category_list].flatten, :any => true).uniq.first(page_event.number_of_related_pages - page_event.related_pages.count) if page_event.number_of_related_pages - page_event.related_pages.count > 0
    other_stories
  end

end