# From https://gist.github.com/2590040/93cb2faca1ba5ead73222e74ca11790e3efb22de

require File.join(Rails.root, 'lib', 'google_bot_aware')

Unseen::Application.configure do
  config.middleware.use("GoogleBotAware")
end