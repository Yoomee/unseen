source 'http://rubygems.org'

### Always used
gem 'rails', '3.1.0'
gem 'mysql2'
gem "rake", "0.8.7"

### Frequently used
gem 'formtastic-bootstrap', :git => "git://github.com/cgunther/formtastic-bootstrap.git", :branch => "bootstrap-2"
gem 'exception_notification'

def ym_gem(gem_name)
 return true unless gem_name
 if File.dirname(__FILE__) =~ /^\/data\//
   # On Engine Yard server - get from git
   gem gem_name, :git => "git://git.yoomee.com:4321/gems/#{gem_name}.git"
 else
   system("git clone -q git://git.yoomee.com:4321/gems/#{gem_name}.git #{gem_path}") if !File.directory?(gem_path = "vendor/gems/#{gem_name}")
   gem gem_name, :path => "vendor/gems"
 end
end

### Yoomee gems
ym_gem 'ym_core'
ym_gem 'ym_cms'
ym_gem 'ym_permalinks'
ym_gem 'ym_posts'
ym_gem 'ym_search'
ym_gem 'ym_tags'
ym_gem 'ym_users'

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
