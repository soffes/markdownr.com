Markdownr::Application.routes.draw do |map|

  match "/process_markdown", :to => "markdownr#process_markdown"
  root :to => "home#index"

end
