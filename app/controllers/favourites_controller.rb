class FavouritesController < ApplicationController
  
  load_and_authorize_resource
  
  def create
    @favourite = current_user.favourites.find_or_create_by_resource_type_and_resource_id(params[:favourite][:resource_type],params[:favourite][:resource_id])
    current_user.record_activity!(@favourite)
    render :action => "add_remove"    
  end
  
  def destroy
    @favourite = Favourite.find(params[:id])
    @favourite.activity_items.destroy_all
    @favourite.update_attribute(:deleted, true)
    render :action => "add_remove"
  end
  
end