require 'rubygems'
require 'bundler'
Bundler.require

# Force the correct host
use Rack::CanonicalHost, ENV['CANONICAL_HOST'] if ENV['CANONICAL_HOST']

# Require application
$:.unshift 'lib'
require 'markdownr'

# Run!
run Markdownr::Application
