class Api::GalleriesController < ApplicationController
  
  def index
    case params[:version]
    when "2013"
      render :json => Page.find_by_view_name_and_edition(:galleries, params[:version]).children.to_json(:only => [:id, :title], :include => {:photos => {:only => [:id], :methods => [:image_url_for_api]}, :photographers => {:only => [:id]}}, :methods => [:contact_details])
    when "2"
      render :json => Page.find_by_slug('galleries').children.to_json(:only => [:id, :title], :include => {:photos => {:only => [:id], :methods => [:image_url_for_api]}, :photographers => {:only => [:id]}}, :methods => [:contact_details])
    else
      render :json => Page.find_by_slug('galleries').children.to_json(:only => [:id, :title], :methods => [:contact_details])
    end
  end
  
end