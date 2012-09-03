class CollectionPhotosController < ApplicationController

  load_and_authorize_resource

  def create
    if @collection_photo.save
      flash_notice(@collection_photo)
      redirect_to collection_photos_path
    else
      render :action => "new"
    end
  end
  
  def destroy
    @collection_photo.destroy
    flash_notice(@collection_photo)
    redirect_to collection_photos_path
  end
  
  def edit
    
  end
  
  def index
    @collection_photos = CollectionPhoto.all
  end
  
  def new
    
  end
  
  def update
    if @collection_photo.update_attributes(params[:collection_photo])
      flash_notice(@collection_photo)
      redirect_to collection_photos_path
    else
      render :action => "edit"
    end
  end
  
end