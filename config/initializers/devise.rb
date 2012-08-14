Devise.setup do |config|
  
  if Rails.env == 'development'
    # development
    config.omniauth :facebook, "137557166307145", "4f39d3e37e194f4113f49a68e2f6af91", :scope => "email"
    config.omniauth :twitter, "NIWYejijuj6icfVsJx92A", "KJxlaKvr6M4qrkdnO6XodQQsmhU24kFrQ3qzxgII"
  elsif %x{pwd}.match(/^\/data\/unseen_staging\//).present?
    # staging
    config.omniauth :facebook, "371405329597200", "9615893e5972dcc00a4c086275c439e9", :scope => "email"
  else
    # production
    config.omniauth :facebook, "246548905437706", "7e0f964b3561b0abd3be1952f4016bd0", :scope => "email"
  end
  
end