class EventsController < ApplicationController

  load_and_authorize_resource

  def add
    unless current_user.events.include?(@event)
      current_user.events << @event
      current_user.record_activity!(@event)
    end
    render :action => :add_remove
  end

  def remove
    if current_user.events.include?(@event)
      current_user.events.delete(@event)
    end
    render :action => :add_remove
  end

  def create
    if @event.save
      flash_notice(@event)
      redirect_to @event
    else
      render :action => "new"
    end
  end

  def destroy
    @event.destroy
    flash_notice(@event)
    redirect_to program_path
  end

  def edit
  end

  def new
    @event = Event.new(:starts_at => "09:00", :ends_at => "10:00")
  end

  def index
    @date = Event::DATES.select{|d| d.strftime('%a') == params[:day].to_s.titleize}.first || Event::DATES.first
    @events = Event.where(:date => @date).order(:starts_at)
  end

  def show
    @date = @event.date
  end

  def update
    if @event.update_attributes(params[:event])
      flash_notice(@event)
      redirect_to @event
    else
      render :action => "edit"
    end
  end  

end