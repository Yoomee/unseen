class Api::EventsController < ApplicationController
  
  def index
    render :json => Event.all.to_json(:methods => [:day1,:day2,:day3,:day4,:day5,:venue_name,:time_string,:image_url_for_api, :image_url_for_api])
  end
  
  def show
    @page_title = "Programme"
    @event = Event.find(params[:id])
    @date = @event.date
  end
  
end