module Markdownr
  class Application < Sinatra::Application
    include Parsing

    DEFAULT_MARKDOWN = "Welcome to [Markdownr.com](http://markdownr.com). We hope you **really** enjoy using this.\n\nJust type some [markdown](http://daringfireball.net/projects/markdown) on the left and see it on the right. *Simple as that.*".freeze
    DEFAULT_HTML = Parsing.markdown(DEFAULT_MARKDOWN).freeze

    get '/' do
      erb :home
    end

    post '/api/v2/convert' do
      # Markdown -> HTML
      if request.accept? 'text/html'
        headers 'Content-Type' => 'text/html; charset=utf8'
        return markdown(request.body)
      end

      # HTML -> Markdown
      if request.accept? 'text/x-markdown'
        headers 'Content-Type' => 'text/x-markdown; charset=utf8'
        return unmarkdown(request.body)
      end

      # Bad request
      status 400
      '400 Bad request'
    end
  end
end
