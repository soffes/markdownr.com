require 'rubygems'
require 'bundler'
Bundler.require

# Force the correct host
use Rack::CanonicalHost, ENV['CANONICAL_HOST'] if ENV['CANONICAL_HOST']

# Setup sprockets
map '/assets' do
  sprockets = Sprockets::Environment.new
  sprockets.append_path 'assets/javascripts'
  sprockets.append_path 'assets/stylesheets'
  sprockets.append_path 'assets/images'
  run sprockets
end

# Require application
$:.unshift 'lib'
require 'markdownr'

# Run!
run Markdownr::Application
