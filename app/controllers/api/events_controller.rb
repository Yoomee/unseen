class Api::EventsController < ApplicationController
  
  def index
  end
  
  def index
    case params[:version].to_i || 1
    when 2
      render :json => Event.all.to_json(:only => [:id, :description, :title, :image_url_for_api, :image_height_for_api], :methods => [:day1,:day2,:day3,:day4,:day5,:venue_name,:time_string])
    else
      render :json => Event.all.to_json(:only => [:id, :description, :title, :image_url_for_api, :image_height_for_api], :methods => [:day1,:day2,:day3,:day4,:day5,:venue_name,:time_string])
    end
  end
  
  
end