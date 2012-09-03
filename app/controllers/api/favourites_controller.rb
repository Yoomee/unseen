class Api::FavouritesController < ApplicationController
  
  protect_from_forgery :except => [:create]
  
  def create
    @favourite = current_api_user.favourites.create(params[:favourite])
    current_api_user.record_activity!(@favourite) if @favourite.valid?
    render :json => {:success => true}
  end
  
  def destroy
    @favourite = Favourite.find(params[:id])
    if @favourite.user == current_api_user
      @favourite.destroy
    end
    render :json => {:success => true}
  end
  
  private
  def current_api_user
    @current_api_user ||= User.find_by_api_key(request.headers['APIKEY'])
  end
  
end
