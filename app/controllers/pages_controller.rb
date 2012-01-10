class PagesController < ApplicationController
  def home
    @default_parser = 'redcarpet'
    @default_raw = "Welcome to [Markdownr.com](http://markdownr.com). We hope you **really** enjoy using this.\n\nJust type some [markdown](http://daringfireball.net/projects/markdown) on the left and see it on the right. *Simple as that.*"
    @default_html = Markdownr::Parser.parse(@default_raw, 'rdiscount')
  end
end
