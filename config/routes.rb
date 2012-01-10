Markdownr::Application.routes.draw do
  root :to => 'pages#home'
  match '/process', :to => 'markdown#process_markdown', :as => 'process_markdown'
end
