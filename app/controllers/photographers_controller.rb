class PhotographersController < ApplicationController

  # authorize_resource :class => false
  
  before_filter :custom_authorize
  
  expose(:photographer) do
    user = User.find_by_id(params[:id]) || User.new
    if params[:photographer]
      user.attributes = params[:photographer]
    end
    user
  end
  expose(:photographers) {User.where(:role => 'photographer')}

  def create
    if photographer.update_attributes(:role => 'photographer')
      redirect_to(photographer)
    else
      render :action => "new"
    end
  end
  
  def destroy
    photographer.destroy
    flash_notice(photographer)
    return_or_redirect_to(photographers_path)
  end
  
  def index
    
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
  
  def custom_authorize
    if params[:action]=='show' || params[:id].blank?
      authorize!(params[:action].to_sym, :photographer)
    else
      authorize!(params[:action].to_sym, photographer)
    end
  end
  
end