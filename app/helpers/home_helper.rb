require "markdownr/parser"

module HomeHelper
  def parser_select default = 'rdiscount'
    html = '<select id="parser" name="parser">'
    Markdownr::Parser::PARSERS.each do |group|
      html << "<optgroup label=\"#{group[:name]}\">"
      group[:parsers].each do |parser|
        selected = (parser.downcase == default.downcase) ? ' selected="selected"' : ''
        html << "<option value=\"#{parser.downcase}\"#{selected}>#{parser}</option>"
      end
      html << '</optgroup>'
    end
    html << '</select>'
    html.html_safe
  end
end
