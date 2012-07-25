class Mobile::NewsController < MobileController
  
  def index
    @page = Page.find_by_slug(:news)
    @page_title = @page.title
    @page_children = @page.children.order("created_at DESC").paginate(:per_page => 8, :page => params[:page])
    render :template => "mobile/pages/list"
  end
  
end