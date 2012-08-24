class Api::EventsController < ApplicationController
  
  def index
    render :json => Event.all.to_json(:methods => [:day1,:day2,:day3,:day4,:day5,:venue_name,:time_string,:api_image_url, :api_image_height])
  end
  
  def show
    @page_title = "Programme"
    @event = Event.find(params[:id])
    @date = @event.date
  end
  
end