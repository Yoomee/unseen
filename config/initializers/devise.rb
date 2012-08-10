Devise.setup do |config|
  
  # Yoomee Localhost
  config.omniauth :facebook, "246548905437706", "7e0f964b3561b0abd3be1952f4016bd0", :scope => "email"
  
end