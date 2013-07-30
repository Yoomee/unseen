class Api::EventsController < ApplicationController
  
  def index
    case params[:version]
    when "2013"
      render :json => Event.where("YEAR(date) = ?", params[:version].to_i).to_json(:only => [:id, :description, :title, :image_url_for_api, :image_height_for_api], :methods => [:day1,:day2,:day3,:day4,:day5,:venue_name,:time_string])
    else
      render :json => Event.where("YEAR(date) = ?", 2012).to_json(:only => [:id, :description, :title, :image_url_for_api, :image_height_for_api], :methods => [:day1,:day2,:day3,:day4,:day5,:venue_name,:time_string])
    end
  end
  
end