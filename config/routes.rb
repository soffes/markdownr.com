Markdownr::Application.routes.draw do |map|

  match "/process_markdown", :to => proc { |env|
    text = Rack::Request.new(env).params["notepad"]
    output = text.blank? ? "" : RDiscount.new(text).to_html
    [200, {}, output]
  }

  root :to => "home#index"

end
