class EventsController < ApplicationController
  
  def create
    @event = Event.new(params[:event])
    if @event.save
      flash_notice(@event)
      redirect_to @event
    else
      render :action => "new"
    end
  end
  
  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash_notice(@event)
    redirect_to events_path
  end
  
  def edit
    @event = Event.find(params[:id])
  end
  
  def new
    @event = Event.new(:starts_at => "09:00", :ends_at => "10:00")
  end
  
  def index
  end
  
  def show
    @event = Event.find(params[:id])
  end
  
  def update
    @event = Event.find(params[:id])
    if @event.update_attributes!(params[:event])
      flash_notice(@event)
      redirect_to @event
    else
      render :action => "edit"
    end
  end  
  
end