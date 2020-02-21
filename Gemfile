source 'https://rubygems.org'

ruby '2.7.0'

# Simple routing
gem 'sinatra'

# Web server
gem 'puma'

# Use the right host
gem 'rack-canonical-host'

# Markdown -> HTML
gem 'redcarpet', require: false

# HTML -> Markdown
gem 'unmarkdown', require: false

# Code coloring
gem 'pygments.rb', require: false

# Utilities
gem 'rake'

group :development do
  # Reloading in development
  gem 'shotgun'
end

group :test do
  gem 'minitest'
  gem 'minitest-rg'
  gem 'rack-test'
end
