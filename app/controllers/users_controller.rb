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
  
end