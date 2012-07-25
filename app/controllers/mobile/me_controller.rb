class Mobile::MeController < MobileController
  
  def index
    if !current_user
      @user = User.new(:remember_me => true)
      render :template => 'mobile/sessions/new' and return
    else
      @user = current_user
      @page_title = "My profile"
    end
  end
  
end