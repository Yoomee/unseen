class UsersController < ApplicationController
  
  include YmUsers::UsersController
  load_and_authorize_resource  
  
  expose(:wall_posts) {user.wall_posts.page(params[:page])}  
  
  def welcome
    redirect_to(api_redirect_path) if session.delete(:api_auth)
  end
  
  def show
    if user.photographer?
      redirect_to photographer_path(user)
    end
  end
  
  def stats
    @users = User.where(:role => nil)
    @registrations = [].tap do |arr|
      @users.where("created_at >= ?",2.months.ago).group("DATE(created_at)").count.each do |date, count|
        arr << [date.strftime("%d/%m/%y"), count]
      end
    end
  end
  
  
end