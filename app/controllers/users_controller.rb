class UsersController < ApplicationController
  
  include YmUsers::UsersController
  
  expose(:wall_posts) {user.wall_posts.page(params[:page])}  
  
  def show
    if user.photographer?
      redirect_to photographer_path(user)
    end
  end
  
end