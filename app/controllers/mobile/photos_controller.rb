class Mobile::PhotosController < MobileController
  load_and_authorize_resource
  def show
    @page_title = "Collect"
  end
  
end