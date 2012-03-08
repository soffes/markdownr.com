source 'http://rubygems.org'

gem 'rails', '3.2.2'
gem 'thin'
gem 'foreman'

gem 'nokogiri'
gem 'pygmentize'

# Markdown
gem 'redcarpet', '1.17.2'
gem 'rdiscount'
gem 'bluecloth'
gem 'kramdown'
gem 'maruku'

# Textile
gem 'RedCloth'

# RDoc
gem 'rdoc'

# Wiki
gem 'wikitext'

group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
  gem 'jquery-rails'
end

group :development do
  gem 'heroku'
end

group :test, :development do
  gem 'rspec-rails'
  gem 'ruby-debug19'
end

group :production do
  gem 'rack-cache', :require => 'rack/cache'
  gem 'therubyracer'
end
