require "rdiscount"
require "digest/md5"

module Markdownr
  class Parser
    def self.parse(text)
      return "" unless text && !text.empty?
      
      # Extract pre blocks
      extractions = {}
      text.gsub!(%r{<pre>.*?</pre>}m) do |match|
        md5 = Digest::MD5.hexdigest(match)
        extractions[md5] = match
        "{gfm-extraction-#{md5}}"
      end

      # prevent foo_bar_baz from ending up with an italic word in the middle
      text.gsub!(/(^(?! {4}|\t)\w+_\w+_\w[\w_]*)/) do |x|
        x.gsub('_', '\_') if x.split('').sort.to_s[0..1] == '__'
      end

      # in very clear cases, let newlines become <br /> tags
      text.gsub!(/^[\w\<][^\n]*\n+/) do |x|
        x =~ /\n{2}/ ? x : (x.strip!; x << "  \n")
      end
    
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
          
      # Remove <script>
      text = CGI.escapeElement(text, "script")
      
      # Insert pre block extractions
      text.gsub!(/\{gfm-extraction-([0-9a-f]{32})\}/) do
        "\n\n" + extractions[$1]
      end
    
      # Parse!
      RDiscount.new(text).to_html
    end
  end
end
