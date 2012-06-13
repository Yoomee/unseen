class HomeController < ApplicationController

  expose(:news_page) { Page.find_by_slug("news") }
  expose(:news_pages) { news_page ? news_page.children.order("created_at DESC").limit(6) : [] }
  expose(:homepage_slideshow) {Slideshow.find_by_slug('homepage')}
  
  def index
  end
  
end