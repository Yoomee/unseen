source 'http://rubygems.org'


### Always used
gem 'rails', '3.1.0'
gem 'mysql2'
gem "rake", "0.8.7"

### Frequently used
gem 'haml'
# gem "formtastic-bootstrap", "~> 1.2.0"
gem 'formtastic-bootstrap', :git => "git://github.com/cgunther/formtastic-bootstrap.git", :branch => "bootstrap-2"
gem 'rinku'

### Yoomee gems

if File.dirname(__FILE__) =~ /\/data\//
  # production
  gem 'ym_core', :git => "git://git.yoomee.com:4321/gems/ym_core.git"
  gem 'ym_cms', :git => "git://git.yoomee.com:4321/gems/ym_cms.git"
else
  # development
  gem 'ym_core', :path => "vendor/gems"
  gem 'ym_cms', :path => "vendor/gems"
end

### Groups

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

gem 'jquery-rails'

group :development do
  gem 'growl'
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
