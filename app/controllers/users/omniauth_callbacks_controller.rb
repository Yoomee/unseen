class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  
  def facebook
    begin
      @user = User.find_or_create_by_facebook_oauth(request.env["omniauth.auth"], current_user)
    rescue User::FacebookAuth::ConnectedWithDifferentAccountError => e
      flash[:error] = "You have already connected with a different Facebook account"
      redirect_to root_path
    rescue User::FacebookAuth::AccountAlreadyUsedError => e
      flash[:error] = "Someone else has already connected with this Facebook account"
      redirect_to root_path
    else
      if @user.last_sign_in_at.nil?
        flash[:notice] = "Successfully connected with your Facebook account."
        sign_in(:user, @user, :event => :authentication)
        redirect_to welcome_users_path
      else
        if @user.just_connected_facebook?
          flash[:notice] = "Successfully connected with your Facebook account."
        end
        sign_in_and_redirect @user, :event => :authentication
      end
    end
  end
  
  def twitter
    begin
      @user = User.find_or_create_by_twitter_oauth(request.env["omniauth.auth"], current_user)
    rescue User::TwitterAuth::ConnectedWithDifferentAccountError => e
      flash[:error] = "You have already connected with a different Twitter account"
      redirect_to root_path
    rescue User::TwitterAuth::AccountAlreadyUsedError => e
      flash[:error] = "Someone else has already connected with this Twitter account"
      redirect_to root_path
    else
      if @user.last_sign_in_at.nil?
        flash[:notice] = "Successfully connected with your Twitter account."
        sign_in(:user, @user, :event => :authentication)
        redirect_to welcome_users_path
      else
        if @user.just_connected_twitter?
          flash[:notice] = "Successfully connected with your Twitter account."
        end
        sign_in_and_redirect @user, :event => :authentication
      end
    end
  end
  
end