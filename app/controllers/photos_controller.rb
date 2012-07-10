class PhotosController < ApplicationController
  
  def add
    @photo = Photo.find(params[:id])
    current_user.favourite_photos << @photo
    render :action => :add_remove
  end
  
  def remove
    @photo = Photo.find(params[:id])
    current_user.favourite_photos.delete(@photo)
    render :action => :add_remove
  end
end