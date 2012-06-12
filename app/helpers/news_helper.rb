module NewsHelper
  
  def news_page
    Page.find_by_slug("news")
  end
  
  def news_pages
    news_page ? news_page.children.order("created_at DESC").limit(6) : []
  end
  
end