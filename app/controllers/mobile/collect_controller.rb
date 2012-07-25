class Mobile::CollectController < MobileController
  
  def index
  end
  
  def explore
    @page = Page.find_by_slug(:mobile_explore)
    @page_title = @page.title
    render :template => "mobile/pages/list"
  end
  
  def photos
    @page_title = "Collect"
    @photos = Photo.paginate(:per_page => 16, :page => params[:page])
  end
  
end