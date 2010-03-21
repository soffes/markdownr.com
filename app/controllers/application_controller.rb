require "markdownr/parser"
 
class ApplicationController < ActionController::Base
  helper :all
  protect_from_forgery 
  
  helper_method :markdown
  
  protected
  
  def markdown(text)
    Markdownr::Parser.parse(text)
  end 
end
