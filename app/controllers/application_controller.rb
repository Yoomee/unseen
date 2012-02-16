class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate

  AUTH_USERS = { "unseen" => "photo123" }

  private
  def authenticate
    authenticate_or_request_with_http_digest do |username|
      AUTH_USERS[username]
    end
  end
end
