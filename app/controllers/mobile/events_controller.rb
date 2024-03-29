class Mobile::EventsController < MobileController
  
  def index
    @page_title = "Programme"
    @date = Event.festival_dates.select{|d| d.strftime('%a') == params[:day].to_s.titleize}.first || Event.festival_dates.first
    @events = Event.where(:date => @date).order(:starts_at)
  end
  
  def show
    @page_title = "Programme"
    @event = Event.find(params[:id])
    @date = @event.date
  end
  
end