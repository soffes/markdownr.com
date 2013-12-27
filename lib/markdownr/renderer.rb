require 'redcarpet'
require 'pygments.rb'

module Markdownr
  class Renderer < Redcarpet::Render::HTML
    include Redcarpet::Render::SmartyPants

    def block_code(code, language)
      language ||= 'text'
      Pygments.highlight(code, lexer: language.to_sym)
    end
  end
end
