require File.expand_path('../lib/ym_gem_loader', __FILE__) 

source 'http://rubygems.org'


### Always used
gem 'rails', '3.1.0'
gem 'mysql2'
gem "rake", "0.8.7"

### Frequently used
gem 'country-select'
gem 'formtastic-bootstrap', :git => "git://github.com/cgunther/formtastic-bootstrap.git", :branch => "bootstrap-2"
gem 'exception_notification'

gem 'cocoon'

# def ym_gem(gem_name, checkout = nil)
#   return true unless gem_name
#   if !File.directory?(gem_path = "vendor/gems/#{gem_name}")
#     system("git clone -q git://git.yoomee.com:4321/gems/#{gem_name}.git #{gem_path}")
#     system("git checkout #{checkout}") if checkout
#   end
#   gem gem_name, :path => "vendor/gems"
# end

# ym_gemfile = File.expand_path('../Gemfile.ym', __FILE__)
# eval(IO.read(ym_gemfile), binding, ym_gemfile)

load_ym_gems!

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
  gem 'ruby-debug19', :require => 'ruby-debug'
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
