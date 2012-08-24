class Api::GalleriesController < ApplicationController
  
  def index
    render :json => Page.find_by_slug('galleries').children.to_json(:only => [:id, :title], :methods => [:contact_details])
  end
  
end