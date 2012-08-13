class CommunityController < ApplicationController

  def index
    if request.xhr?
      per_page = params[:per_page] || 6
      @items = case params[:item_type]
      when "activity_item"
        YmActivity::ActivityItem.includes(:user,:resource).paginate(:per_page => per_page, :page => params[:page])
      when "event"
        Event.popular.paginate(:per_page => per_page, :page => params[:page])
      when "photo"
        Photo.popular.paginate(:per_page => per_page, :page => params[:page])
      end
    else
      @activity_items = YmActivity::ActivityItem.includes(:user,:resource).paginate(:per_page => 12, :page => params[:page])
      @photos = Photo.popular.paginate(:per_page => 6, :page => params[:page])
      @events = Event.popular.paginate(:per_page => 6, :page => params[:page])
      @tweets = view_context.latest_tweets('UnseenPhotoFair', :count => 30, :trim_user => false).first(4)
    end
  end
  
  def activity
    @activity_items = YmActivity::ActivityItem.includes(:user,:resource).paginate(:per_page => 18, :page => params[:page])
  end
  
  def photos
    @photos = Photo.popular.paginate(:per_page => 48, :page => params[:page])
  end

  def people
    @tags = Tag.user_tags
    if params[:tag]
      @people = User.tagged_with(["#{params[:tag]}"], :any => true)
    elsif params[:q]
      @query = strip_tags(params[:q]).to_s.strip
      if @query.present?
        @people = User.search(@query, :star => true)
      else
        @people = []
      end
    else
      @people = User.order(:last_name)
    end
  end

end