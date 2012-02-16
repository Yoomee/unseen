source 'http://rubygems.org'


#Always used
gem 'rails', '3.1.0'
gem 'mysql2'
gem "rake", "0.8.7"

#Frequently used
gem 'haml'

# Project specific

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

gem 'jquery-rails'

group :production do 
  gem 'ym_core', :git => "git://git.yoomee.com:4321/gems/ym_core.git"
  gem 'ym_cms', :git => "git://git.yoomee.com:4321/gems/ym_cms.git"
end

group :development do
  gem 'growl'
end

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

gem "rspec-rails", :group => [:test, :development]
group :test do
  gem "factory_girl_rails"
  gem 'shoulda-matchers'
  gem "capybara"
  gem "guard-rspec"
  #gem 'turn', :require => false
end
