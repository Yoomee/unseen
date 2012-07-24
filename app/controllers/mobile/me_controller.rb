class Mobile::MeController < MobileController
  
  def index
    if !current_user
      @user = User.new(:remember_me => true)
      render :template => 'mobile/sessions/new' and return
    end
  end
  
end