class Api::SessionsController < ApplicationController
  
  def api_authenticate
    if current_user
      current_user.update_attribute(:api_authenticated, true) unless current_user.api_authenticated?
      redirect_to api_redirect_path
    else
      session[:api_auth] = true
      redirect_to sign_in_path
    end
  end
  
  def api_redirect
    if current_user.blank?
      redirect_to api_authenticate_path
    else
      user_params = {
        "UserID" => current_user.id,
        "UserApiKey" => current_user.api_key,
        "UserFirstName" => current_user.first_name,
        "UserLastName" => current_user.last_name
      }
      user_params["UserImageURL"] = current_user.image.thumb("55x55#").url if current_user.image
      redirect_to "unseen://api?#{user_params.to_query}"
    end
  end
  
end
