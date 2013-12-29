require 'sinatra'

module Markdownr
  class Application < Sinatra::Application
    include Parsing

    DEFAULT_MARKDOWN = "Welcome to [Markdownr.com](http://markdownr.com). We hope you **really** enjoy using this.\n\nJust type some [markdown](http://daringfireball.net/projects/markdown) on the left and see it on the right. *Simple as that.*".freeze
    DEFAULT_HTML = Parsing.markdown(DEFAULT_MARKDOWN).freeze

    # Homepage
    get '/' do
      erb :home
    end

    # API Docs
    get '/api/?' do
      erb :api
    end

    # API
    post '/api/v2/convert' do
      body = request.body.read
      unless body && body.length > 0
        status 400
        return 'You must post content to be converted.'
      end

      # I couldn't figure out the built-in accept stuff, so here we go.
      accepts = env['HTTP_ACCEPT'].split(',').map do |item|
        item = item.strip.sub(/^(.*)(;.+)$/, "\1")
      end
      content_type = env['CONTENT_TYPE']

      # HTML -> Markdown
      if accepts.include?('text/x-markdown')
        unless content_type.include?('text/html')
          status 400
          return 'You must post `text/html` when accepting `text/x-markdown`.'
        end

        headers 'Content-Type' => 'text/x-markdown; charset=utf8'
        return unmarkdown(body)
      end

      # Markdown -> HTML
      if accepts.include?('text/html')
        unless content_type.include?('text/x-markdown')
          status 400
          return 'You must post `text/x-markdown` when accepting `text/html`.'
        end

        headers 'Content-Type' => 'text/html; charset=utf8'
        return markdown(body)
      end

      status 406
      'You must explicitly accept `text/x-markdown` or `text/html`.'
    end
  end
end
