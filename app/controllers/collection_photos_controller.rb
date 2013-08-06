class CollectionPhotosController < ApplicationController

  load_and_authorize_resource

  def create
    if @collection_photo.save
      flash_notice(@collection_photo)
      redirect_to collection_photos_edition_path(:edition => @collection_photo.edition)
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
  
  def edition
    @collection_photos = CollectionPhoto.where(:edition => params[:edition])
    render :action => 'index'
  end
  
  def index
    redirect_to collection_photos_edition_path(:edition => Settings.current_edition)
  end

  def new
    @collection_photo.edition = params[:edition].presence || Settings.current_edition
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