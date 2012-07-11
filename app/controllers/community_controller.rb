class CommunityController < ApplicationController

  def index
    if request.xhr?
      @items = case params[:item_type]
      when "activity_item"
        YmActivity::ActivityItem.includes(:user,:resource).paginate(:per_page => 6, :page => params[:page])
      when "event"
        Event.popular.paginate(:per_page => 6, :page => params[:page])
      when "photo"
        Photo.popular.paginate(:per_page => 6, :page => params[:page])
      end
    else
      @activity_items = YmActivity::ActivityItem.includes(:user,:resource).paginate(:per_page => 6, :page => params[:page])
      @photos = Photo.popular.paginate(:per_page => 6, :page => params[:page])
      @events = Event.popular.paginate(:per_page => 6, :page => params[:page])
    end
  end

end