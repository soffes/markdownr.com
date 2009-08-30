# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.3' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|

  config.frameworks -= [ :active_record, :active_resource, :action_mailer ]

  # Specify gems that this application depends on and have them installed with rake gems:install
  config.gem "maruku"
  config.gem "haml", :version => "2.2.2"
  config.gem "chriseppstein-compass", :version => "~> 0.8.8", :lib => "compass", :source => "http://gems.github.com"

  # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
  # Run "rake -D time" for a list of tasks for finding time zone names.
  config.time_zone = "Central Time (US & Canada)"
  
end
