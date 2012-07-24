class Mobile::MoreController < MobileController
  
  def index
    @page = Page.find_by_slug(:app_more)
  end
  
end