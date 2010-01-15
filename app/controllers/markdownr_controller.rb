class MarkdownrController < ActionController::Metal
  include ActionController::RackDelegation
  
  def process_markdown
    text = params[:notepad]
    self.response_body = text.presence && RDiscount.new(text).to_html
  end
end
