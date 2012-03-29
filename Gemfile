source 'http://rubygems.org'


### Always used
gem 'rails', '3.1.0'
gem 'mysql2'
gem "rake", "0.8.7"

### Frequently used
gem 'haml'
gem 'formtastic-bootstrap', :git => "git://github.com/cgunther/formtastic-bootstrap.git", :branch => "bootstrap-2"
gem 'rinku'
gem 'exception_notification'
gem 'jquery-rails'
gem 'devise'

### Yoomee gems
gem 'ym_core', :path => "vendor/gems"
gem 'ym_cms', :path => "vendor/gems"
gem 'ym_permalinks', :path => 'vendor/gems'
gem 'ym_posts', :path => 'vendor/gems'
gem 'ym_search', :path => "vendor/gems"
gem 'ym_tags', :path => 'vendor/gems'
gem 'ym_users', :path => 'vendor/gems'

### Groups

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

group :development do
  gem 'growl'
  gem 'yoomee', :git => "git://git.yoomee.com:4321/gems/yoomee.git", :branch => "rails3"
  # comment this when deploying
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
