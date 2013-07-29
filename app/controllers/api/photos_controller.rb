class Api::PhotosController < ApplicationController
  
  def index
    render :json => Photo.from_edition(params[:version]).to_json(:only => [:id, :caption], :methods => [:image_url_for_api])
  end
  
end