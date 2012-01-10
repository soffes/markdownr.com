require 'digest/md5'

module Markdownr
  class Parser
    PARSERS = [
      {
        :name => 'Markdown',
        :parsers => ['Redcarpet', 'RDiscount', 'BlueCloth', 'Kramdown', 'Maruku']
      },
      {
        :name => 'Textile',
        :parsers => ['RedCloth']
      },
      {
        :name => 'RDoc',
        :parsers => ['RDoc']
      },
      {
        :name => 'Wiki',
        :parsers => ['Wikitext']
      }
    ]
    
    def self.parse(text, parser = 'markdown')
      return '' unless text && !text.empty?
      
      # Strip evil stuff
      text = preprocess(text)
      
      # Parse!
      case parser
      when 'redcarpet'
        rc_options = [:hard_wrap, :autolink, :no_intraemphasis, :fenced_code, :gh_blockcode]
        doc = Nokogiri::HTML(Redcarpet.new(text, *rc_options).to_html)
        doc.search("//pre[@lang]").each do |pre|
          pre.replace Pygmentize.process(pre.text.strip, pre[:lang].to_sym)
        end
        doc.css('body > *').to_s
      when 'bluecloth'
        BlueCloth.new(text).to_html
      when 'kramdown'
        Kramdown::Document.new(text).to_html
      when 'maruku'
        Maruku.new(text).to_html
      when 'redcloth'
        RedCloth.new(text).to_html
      when 'rdoc'
        require 'rdoc/markup/to_html'
        RDoc::Markup::ToHtml.new.convert(text)
      when 'wikitext'
        Wikitext::Parser.new.parse(text)
      else
        RDiscount.new(text).to_html
      end
    end
    
    def self.preprocess(text)
      # Extract pre blocks
      extractions = {}
      text.gsub!(%r{<pre>.*?</pre>}m) do |match|
        md5 = Digest::MD5.hexdigest(match)
        extractions[md5] = match
        "{markdownr-extraction-#{md5}}"
      end
      
      # Remove <script>
      text.gsub!(%r{<script(\s+(\w+)(?:\s*=\s*(?:".*?"|'.*?'|[^'">\s]+)))?>.*?</script>}m, '')
      
      # Remove evil attributes. This could be a lot better
      evil_attributes = %w{onchange onsubmit onreset onselect onblur onfocus onkeydown onkeypress onkeyup onclick onmousedown onmousemove onmouseout onmouseover onmouseup}
      text.gsub!(%r{</?\w+(\s+(\w+)(?:\s*=\s*(?:".*?"|'.*?'|[^'">\s]+)))+\s*/?>}) do |match|
        if $1 && evil_attributes.include?($2)
          match.gsub!($1, "")
        end
        
        # Replace `href="javascript:"` stuff
        match.gsub!(/href(\s*=\s*(?:"javascript:[^"]*?"|'javascript:[^']*?'|javascript:[^'">\s]+))/, 'href="javascript:;"')
        match
      end

      # Prevent foo_bar_baz from ending up with an italic word in the middle
      text.gsub!(/(^(?! {4}|\t)\w+_\w+_\w[\w_]*)/) do |match|
        match.gsub('_', '\_') if match.split('').sort.to_s[0..1] == '__'
      end

      # In very clear cases, let newlines become <br /> tags
      text.gsub!(/^[\w\<][^\n]*\n+/) do |match|
        match =~ /\n{2}/ ? match : (match.strip!; match << "  \n")
      end
      
      # Insert pre block extractions
      text.gsub!(/\{markdownr-extraction-([0-9a-f]{32})\}/) do
        "\n\n" + extractions[$1]
      end
      
      text
    end
  end
end
