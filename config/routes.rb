Markdownr::Application.routes.draw do
  match "/process", :to => "markdown#process_markdown", :as => "process_markdown"
  root :to => "home#index"
end
