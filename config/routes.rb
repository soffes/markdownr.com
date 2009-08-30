ActionController::Routing::Routes.draw do |map|
  
  map.home "home", :controller => "home"
  map.root :home
  
end
