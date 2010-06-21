class HomeController < ApplicationController
  def index
    # @default = (params[:parser] or "markdown")
    # 
    # @defaults = {
    #   "markdown" => "Welcome to [Markdownr.com](http://markdownr.com). We hope you **really** enjoy using this.\n\nJust type some [markdown](http://daringfireball.net/projects/markdown) on the left and see it on the right. *Simple as that.*",
    #   "textile" => "Welcome to \"Markdownr.com\":http://markdownr.com. We hope you *really* enjoy using this.\n\nJust type some \"textile\":http://en.wikipedia.org/wiki/Textile_(markup_language) on the left and see it on the right. _Simple as that._",
    #   "rdoc" => "Welcome to Markdownr.com[http://markdownr.com]. We hope you *really* enjoy using this.\n\nJust type some RDoc[http://rdoc.rubyforge.org/] on the left and see it on the right. <em>Simple as that.</em>"
    # }
    # 
    # @default_raw = @defaults[@default]
    # @default_html = Markdownr::Parser.parse(@default_raw, @default)

    @default_raw = "Welcome to [Markdownr.com](http://markdownr.com). We hope you **really** enjoy using this.\n\nJust type some [markdown](http://daringfireball.net/projects/markdown) on the left and see it on the right. *Simple as that.*"
    @default_html = Markdownr::Parser.parse(@default_raw, "rdiscount")
  end
end
