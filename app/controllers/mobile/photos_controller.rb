class Mobile::PhotosController < MobileController
  load_and_authorize_resource
  def show
    @page_title = "Collect"
  end
  
  def index
    @page_title = "Collect"
    @photos = Photo.paginate(:per_page => 16, :page => params[:page])
  end
  
end