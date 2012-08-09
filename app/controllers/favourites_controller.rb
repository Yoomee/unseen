class FavouritesController < ApplicationController
  
  load_and_authorize_resource
  
  def create
    @favourite = current_user.favourites.create(params[:favourite])
    current_user.record_activity!(@favourite)
    render :action => "add_remove"    
  end
  
  def destroy
    @favourite = Favourite.find(params[:id])
    @favourite.destroy
    render :action => "add_remove"
  end
  
end