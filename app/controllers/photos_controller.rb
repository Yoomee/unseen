class PhotosController < ApplicationController
  
  load_and_authorize_resource
  

  def add
    unless current_user.favourite_photos.include?(@photo)
      current_user.favourite_photos << @photo
      current_user.record_activity!(@photo)
    end
    render :action => :add_remove
  end

  def remove
    if current_user.favourite_photos.include?(@photo)
      current_user.favourite_photos.delete(@photo)
    end
    render :action => :add_remove
  end
  
  def show
    @photographer = @photo.photographer
    @photos = [@photo] + @photographer.photos.without(@photo)
    render :template => "photographers/show"
  end
  
end