class Api::FavouritesController < ApplicationController
  
  protect_from_forgery :except => [:create]
  
  def create
    @favourite = current_api_user.favourites.find_or_initialize_from_app_params(params)
    @favourite.deleted = false
    @favourite.save
    current_api_user.record_activity!(@favourite) if @favourite.valid?
    render :json => @favourite
  end
  
  def destroy
    @favourite = Favourite.find_by_id(params[:id]) # ID may be 0 if not synced properly
    if @favourite && @favourite.user == current_api_user
      @favourite.activity_items.destroy_all
      @favourite.update_attribute(:deleted, true)
    end
    head 204
  end
  
  def index
    edition = params[:version].to_i < 10 ? "2012" : params[:version]
    render :json => Favourite.unscoped.where(:user_id => current_api_user.id, :edition => edition)
  end
  
  def sync
    (params[:favourites] || []).each do |app_favourite_params|
      resource_type, resource_id = Favourite.detect_resource(app_favourite_params)
      if app_favourite_params[:id].to_i.zero? # Created in app when offline
        new_favourite = current_api_user.favourites.create_from_app_params(app_favourite_params)
      else # Exists in app and on web
        app_favourite = Favourite.initialize_from_app_params(app_favourite_params)
        web_favourite = Favourite.unscoped.find(app_favourite_params[:id])
        if app_favourite.updated_at > web_favourite.updated_at # App version changed more recently
          web_favourite.update_attribute(:deleted, app_favourite.deleted)
          if web_favourite.deleted
            web_favourite.activity_items.destroy_all
          else
            new_favourite = web_favourite
          end
        end
      end
      current_api_user.record_activity!(new_favourite) if new_favourite && new_favourite.valid?
    end
    edition = params[:version].to_i < 10 ? "2012" : params[:version]
    render :json => Favourite.unscoped.where(:user_id => current_api_user, :edition => edition)
  end
  
  private
  def current_api_user
    @current_api_user ||= (current_user || User.find_by_api_key(request.headers['APIKEY']))
  end
  
end
