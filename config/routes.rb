ActionController::Routing::Routes.draw do |map|
  
  map.home "home", :controller => "home"
  map.process "process", :controller => "home", :action => "process_input"
  map.root :home
  
end
