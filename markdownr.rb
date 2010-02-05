# Use Bundler
require File.expand_path(File.join(File.dirname(__FILE__), 'vendor', 'gems', 'environment'))
Bundler.require_env

class Markdownr < Sinatra::Default
  set :app_file, __FILE__
  set :root, File.dirname(__FILE__)

  # Import h helper
  helpers do
    include Rack::Utils
    alias_method :h, :escape_html
  end

  # Set UTF-8
  before do
    content_type 'text/html', :charset => 'utf-8'
  end

  # Homepage
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

  # Markdown processor
  post '/process/?' do
    text = params[:notepad]
    text && text.empty? ? '' : RDiscount.new(text).to_html
  end
end
