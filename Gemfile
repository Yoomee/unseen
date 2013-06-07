source 'http://rubygems.org'
source 'https://yoomee:wLjuGMTu30AvxVyIrq3datc73LVUkvo@gems.yoomee.com'

### Always used
gem 'rails', '3.1.0'
gem 'mysql2'
gem "rake", "0.8.7"

### Frequently used
gem 'country-select'
gem 'formtastic-bootstrap', :git => "git://github.com/cgunther/formtastic-bootstrap.git", :branch => "bootstrap-2"
gem 'exception_notification'
gem 'whenever', :require => false

gem 'cocoon'
gem 'geocoder'
gem 'datetimespan'
gem 'omniauth-facebook'
gem 'omniauth-linkedin'
gem 'omniauth-twitter'
gem 'encryptor'

gem 'newrelic_rpm'
gem 'ey_config'

gem 'ym_core',        "~> 0.1.59"  #, :path => "~/Rails/Gems/ym_core"
gem 'ym_cms',         "~> 0.3.9"   #, :path => "~/Rails/Gems/ym_cms"
gem 'ym_permalinks',  "0.1.2"
gem 'ym_posts',       "0.1"
gem 'ym_search',      "0.1"
gem 'ym_tags',        "~> 0.1.4"   #, :path => "~/Rails/gems/ym_tags"
gem 'ym_users',       "~> 0.1.11"  #, :path => "~/Rails/gems/ym_users"
gem 'ym_videos',      "0.1"
gem 'ym_links',       "0.1"
gem 'ym_enquiries',   "~> 0.1.3" #, , :path => "~/Rails/gems/ym_enquiries"
gem 'ym_activity', "~> 0.1.1"      #, :path => "~/Rails/Gems/ym_activity"

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
  #gem 'yoomee', :git => "git://git.yoomee.com:4321/gems/yoomee.git", :branch => "rails3"
  gem 'ym_tools'
  gem 'ruby-debug19', :require => 'ruby-debug'
  gem 'sqlite3'
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
