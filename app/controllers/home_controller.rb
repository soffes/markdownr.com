class HomeController < ApplicationController
  def index
    @default_markdown = "Welcome to [Markdownr.com](http://markdownr.com). We hope you **really** enjoy using this.\n\nJust type some [markdown](http://daringfireball.net/projects/markdown) on the left and see it on the right. *Simple as that.*"
    @default_html = markdown(@default_markdown)
  end
end
