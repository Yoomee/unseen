class Api::EventsController < ApplicationController
  
  def index
    render :json => Event.all.to_json(:only => [:id, :description, :title, :image_url_for_api, :image_height_for_api], :methods => [:day1,:day2,:day3,:day4,:day5,:venue_name,:time_string])
  end
  
  def show
    @page_title = "Programme"
    @event = Event.find(params[:id])
    @date = @event.date
  end
  
end