class MarkdownController < ActionController::Metal
  include ActionController::RackDelegation
  
  def process_markdown
    text = params[:notepad]
    self.response_body = text && text.empty? ? '' : CGI.escapeElement(RDiscount.new(text).to_html, "script")
  end
end
