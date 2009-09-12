# Allow the metal piece to run in isolation
require(File.dirname(__FILE__) + "/../../config/environment") unless defined?(Rails)
require 'maruku'

class ProcessMarkdown
  
  def self.call(env)
    if env["PATH_INFO"] =~ /^\/process_markdown/
      text = Rack::Request.new(env).params["notepad"]
      output = text.blank? ? "" : Maruku.new(text).to_html
      [200, {"Content-Type" => "text/html"}, [output]]
    else
      [404, {"Content-Type" => "text/html"}, ["Not Found"]]
    end
  end
end
