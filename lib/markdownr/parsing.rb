require 'redcarpet'
require 'unmarkdown'

module Markdownr
  module Parsing
    module_function

    def markdown(text, options = {})
      return '' unless text and text.length > 0

      default_options = {
        no_intra_emphasis: true,
        tables: true,
        fenced_code_blocks: true,
        autolink: true,
        strikethrough: true,
        space_after_headers: true,
        superscript: true,
        with_toc_data: true,
        underline: true,
        highlight: true
      }

      markdown = Redcarpet::Markdown.new(Markdownr::Renderer, default_options.merge(options))
      markdown.render(text).strip
    end

    def unmarkdown(html)
      Unmarkdown.parse(html, allow_scripts: true, fenced_code_blocks: true)
    end
  end
end
