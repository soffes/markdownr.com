require 'rubygems'
require 'bundler'
Bundler.require :test

require 'minitest/autorun'

$:.unshift 'lib'
require 'markdownr'

# Support files
Dir["#{File.expand_path(File.dirname(__FILE__))}/support/*.rb"].each do |file|
  require file
end

module Markdownr
  class Test < MiniTest::Test
    include Rack::Test::Methods

    def app
      Markdownr::Application
    end
  end
end
