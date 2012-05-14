class PhotographersController < ApplicationController
  
  expose(:photographer) do
    user = User.find_by_id(params[:id]) || User.new
    if params[:photographer]
      user.attributes = params[:photographer]
    end
    user
  end

  def create
    if photographer.update_attributes(:role => 'photographer')
      redirect_to(photographer)
    else
      render :action => "new"
    end
  end
  
  def update
    if photographer.save
      redirect_to(photographer)
    else
      render :action => "edit"
    end
  end
  
  def show
    if !photographer.photographer?
      redirect_to user_path(photographer)
    end
  end
  
end