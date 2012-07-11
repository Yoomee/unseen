class CommunityController < ApplicationController
  
  def index
    @activity_items = YmActivity::ActivityItem.includes(:resource).order("created_at DESC").paginate(:per_page => 6, :page => params[:page])
  end
  
end