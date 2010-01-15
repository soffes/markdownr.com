require 'rubygems'
require 'sinatra'
require 'rdiscount'

set :app_file, __FILE__
set :root, File.dirname(__FILE__)

before do
  content_type 'text/html', :charset => 'utf-8'
end

get '/' do
  response.headers['Cache-Control'] = 'public, max-age=31557600' # 1 year
  erb :home
end

post '/process' do
  text = params[:notepad]
  text && text.empty? ? '' : RDiscount.new(text).to_html
end
