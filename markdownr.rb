require 'rubygems'
require 'sinatra'
require 'rdiscount'

set :app_file, __FILE__
set :root, File.dirname(__FILE__)

helpers do
  include Rack::Utils
  alias_method :h, :escape_html
end

before do
  content_type 'text/html', :charset => 'utf-8'
end

get '/?' do
  # Cache for 1 year or a new deploy
  response.headers['Cache-Control'] = 'public, max-age=31557600'
  
  # Default text
  default = "Welcome to [Markdownr.com](http://markdownr.com). We hope you **really** enjoy using this.\n\nJust type some [markdown](http://daringfireball.net/projects/markdown) on the left and see it on the right. *Simple as that.*"
  
  # Pass in the default text, stylesheet, and javascript
  erb :home, :locals => {
    :default_markdown => default,
    :default_html => RDiscount.new(default).to_html,
    :stylesheet => File.read('public/stylesheets/application.css'),
    :javascript => File.read('public/javascripts/application.min.js')
  }
end

post '/process/?' do
  text = params[:notepad]
  text && text.empty? ? '' : RDiscount.new(text).to_html
end
