class ApplicationController < ActionController::Base
  include YmUsers::ApplicationController
  protect_from_forgery

  before_filter :authenticate

  AUTH_USERS = { "unseen" => "photo123" }
  
  CURRENT_EDITION = "2012"
  LATEST_EDITION = "2013"

  helper_method :view_preference
  
  def after_sign_in_path_for(resource)
    if session.delete(:api_auth)
      api_redirect_path
    elsif resource.created_at > 5.minutes.ago
      welcome_users_path
    else
      community_path
    end
  end

  def view_preference
    if %w{list block}.include?(session[:view])
      session[:view]
    else
      session[:view] = 'block'
    end
  end

  private
  def authenticate
    return true unless STAGING
    authenticate_or_request_with_http_basic do |username|
      AUTH_USERS[username]
    end
  end
end
