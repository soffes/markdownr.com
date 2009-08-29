class HomeController < ApplicationController
  
  def process_input
    
    json = {
      :timestamp => Time.now.to_datetime,
      :html => markdown(params["notepad"])
    }
    
    respond_to do |format|
      format.json { render :json => json }
    end
  end
  
end
