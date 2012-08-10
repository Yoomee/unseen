class PhotosController < ApplicationController
  
  load_and_authorize_resource
  
  def show
    @photographer = @photo.photographer
    @photos = [@photo] + @photographer.photos.without(@photo)
    render :template => "photographers/show"
  end
  
end