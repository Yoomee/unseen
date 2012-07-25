class Mobile::MoreController < MobileController
  
  def index
    @page = Page.find_by_slug(:app_more)
    @page_title = @page.title
    render :template => "mobile/pages/list"
  end
  
end