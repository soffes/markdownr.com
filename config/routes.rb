Markdownr::Application.routes.draw do
  root :to => 'pages#home'
  match '/api/process', :to => 'markdown#process_markdown', :as => 'process_markdown'
end
