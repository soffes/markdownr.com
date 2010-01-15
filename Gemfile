clear_sources
source "http://gemcutter.org"

# Edge Rails
gem "rails", :git => "git://github.com/rails/rails.git"
# directory "/Users/samsoffes/Desktop/rails", :glob => "{*/,}*.gemspec"
# gem "rails", "3.0.pre"

# Gems
gem "rdiscount", "1.5.5"

# Development gems
only :development do
  gem "compass", "0.8.17"
end

# Heroku gems
only [:staging, :production] do
  gem "rack-cache", "0.5.2", :require_as => "rack/cache"
end

# disable_system_gems
