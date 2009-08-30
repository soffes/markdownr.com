# Allow the metal piece to run in isolation
require(File.dirname(__FILE__) + "/../../config/environment") unless defined?(Rails)
require 'maruku'

class ProcessMarkdown
  
  attr_reader :request
  
  def self.call(env)
    if env["PATH_INFO"] =~ /^\/process_markdown/
      @request = Rack::Request.new(env)
      params = @request.params
      [200, {"Content-Type" => "text/html"}, ProcessMarkdown.markdown(params["notepad"])]
    else
      [404, {"Content-Type" => "text/html"}, ["Not Found"]]
    end
  end
  
  def self.markdown(text)
    text.blank? ? "" : Maruku.new(text).to_html
  end
end
