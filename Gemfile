clear_sources
source "http://gemcutter.org"

# Edge Rails
git "git://github.com/rails/arel.git"
git "git://github.com/rails/rack.git"
gem "rails", "3.0.pre", :git => "git://github.com/rails/rails.git"

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

disable_system_gems
