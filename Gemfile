source "http://rubygems.org"

# Declare your gem's dependencies in survey_says.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# jquery-rails is used by the dummy application
gem "jquery-rails"

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
#
gem 'twitter-bootstrap-rails'
gem "paperclip", "~> 2.4"
gem "mocha", :group => :test

group :development do
  gem 'debugger'
  gem "nifty-generators", :git => 'git://github.com/drhenner/nifty-generators.git'
end

group :test do
  gem 'factory_girl_rails', "~> 1.1.0"
end
