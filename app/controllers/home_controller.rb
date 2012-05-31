class HomeController < ApplicationController

  expose(:news_page) { Page.find_by_slug("news") }
  expose(:news_pages) { news_page ? news_page.children.order("created_at DESC").limit(6) : [] }
  
  def index
  end
  
end