class Mobile::SessionsController < Devise::SessionsController
  layout 'mobile'
  
  def new
    @user = User.new(:remember_me => true)
  end
  
  def create
    resource = warden.authenticate!({:scope=>:user, :recall=>"mobile/sessions#new"})
    set_flash_message(:notice, :signed_in) if is_navigational_format?
    sign_in(:user, resource)
    redirect_to mobile_me_path
  end
  
end