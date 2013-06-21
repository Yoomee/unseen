class EventsController < ApplicationController

  load_and_authorize_resource

  def add
    @favourite = current_user.favourites.find_or_create_by_resource_type_and_resource_id("Event",@event.id)
    current_user.record_activity!(@favourite)
    render :action => :add_remove
  end

  def remove
    @favourite = Favourite.where(:user_id => current_user, :resource_type => "Event", :resource_id => @event.id).first
    @favourite.activity_items.destroy_all
    @favourite.update_attribute(:deleted, true)
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
    @events = Event.on_date(@date).order(:starts_at)
    @venues = @events.collect(&:venue).uniq
    @days = [1,2,3,4,5]
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