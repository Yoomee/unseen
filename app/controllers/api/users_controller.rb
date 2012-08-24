class Api::UsersController < ApplicationController
  
  def index
    render :json => User.where(:role => 'photographer').all
  end
  
end