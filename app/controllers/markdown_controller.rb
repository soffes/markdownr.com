class MarkdownController < ActionController::Metal
  include ActionController::RackDelegation
  
  def process_markdown
    text = params[:notepad]
    self.response_body = text && text.empty? ? '' : RDiscount.new(text).to_html
  end
end
