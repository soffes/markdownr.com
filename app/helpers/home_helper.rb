require "markdownr/parser"

module HomeHelper
  def parser_select default = 'markdown'
    html = '<select id="parser" name="parser">'
    Markdownr::Parser::PARSERS.each do |parser|
      selected = (parser.downcase == default.downcase) ? ' selected="selected"' : ''
      html << "<option value=\"#{parser.downcase}\"#{selected}>#{parser}</option>"
    end
    html << '</select>'
    html.html_safe
  end
end
