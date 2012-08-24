class Api::GalleriesController < ApplicationController
  
  def index
    render :json => Page.find_by_slug('galleries').children.to_json(:only => [:id, :title], :include => {:photos => {:only => [:id, :square_image_url_for_api]}}, :methods => [:contact_details, :photographer_ids])
  end
  
end