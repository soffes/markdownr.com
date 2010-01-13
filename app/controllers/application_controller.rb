require 'rdiscount'

class ApplicationController < ActionController::Base
  helper :all
  protect_from_forgery
  
  helper_method :markdown
  
  private
  
  def markdown(text)
    text.blank? ? "" : RDiscount.new(text).to_html
  end
  
end
