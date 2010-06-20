require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
# require "active_record/railtie"
require "action_controller/railtie"
# require "action_mailer/railtie"
# require "active_resource/railtie"
# require "rails/test_unit/railtie"

# Auto-require default libraries and those for the current Rails environment.
Bundler.require :default, Rails.env

module Markdownr
  class Application < Rails::Application
    config.time_zone = 'Central Time (US & Canada)'

    config.generators do |g|
      g.orm             :active_record
      g.template_engine :erb
      g.test_framework  :rspec, :fixture => true
    end

    config.filter_parameters << :password
    
    config.secret_token = ":WzAxysIpNq[zJW&R5I7/JjBsWkr[O("
  end
end
