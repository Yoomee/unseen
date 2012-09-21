class HomeController < ApplicationController

  expose(:news_page) { Page.find_by_slug("news") }
  expose(:news_pages) { news_page ? news_page.children.order("publication_date DESC, created_at DESC").limit(6) : [] }
  expose(:homepage_slideshow) {Slideshow.find_by_slug('homepage')}
  expose(:persona_pages) {Page.find_by_slug('persona_pages').try(:children) || []}

  def index
  end

end