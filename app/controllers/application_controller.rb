class ApplicationController < ActionController::Base
  include YmUsers::ApplicationController
  protect_from_forgery

  before_filter :authenticate

  AUTH_USERS = { "unseen" => "photo123" }

  helper_method :view_preference

  def view_preference
    if %w{list block}.include?(session[:view])
      session[:view]
    else
      session[:view] = 'block'
    end
  end

  private
  def authenticate
    return true unless Rails.env.production? && request.host == "unseen.yoomee.com" && params[:mercury_frame]
    authenticate_or_request_with_http_basic do |username|
      AUTH_USERS[username]
    end
  end
end
