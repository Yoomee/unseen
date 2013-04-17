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
  
  def clone
    clone = photographer.create_photographer_clone(Settings.edition.latest)
    flash[:notice] = "Created a copy of #{clone} for #{clone.edition}"
    return_or_redirect_to(photographer_path(clone))
  end
  
  def destroy
    photographer.destroy
    flash_notice(photographer)
    return_or_redirect_to(photographers_path)
  end
  
  def edition
    @photographers = User.where(:role => 'photographer', :edition => params[:edition])
    render :action => 'index'
  end
  
  def index
    redirect_to photographers_edition_path(:edition => Settings.edition.current)
  end
  
  def update
    if photographer.save
      redirect_to(photographer)
    else
      render :action => "edit"
    end
  end
  
  def show
    @photographer = photographer
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