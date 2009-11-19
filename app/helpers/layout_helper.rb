module LayoutHelper
  def title(page_title, show_title = true)
    @content_for_title = page_title.to_s
    @show_title = show_title
  end
  
  def show_title?
    @show_title
  end
  
  def stylesheet(*args)
    content_for(:head) { stylesheet_link_tag(*args.map(&:to_s)) }
  end
  
  def javascript(*args)
    #args = args.map { |arg| arg == :defaults ? arg : arg.to_s }
    content_for(:head) { javascript_include_tag(*args) }
  end
  
  def google_analytics(id, always = false)
    # By default, only return Google Analytics code if in production
    # This can be overridden but passing true for the second argument
    (always || ENV['RAILS_ENV'] == 'production') ? "<script type=\"text/javascript\">var gaJsHost=((\"https:\"==document.location.protocol)?\"https://ssl.\":\"http://www.\");document.write(unescape(\"%3Cscript src='\"+gaJsHost+\"google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E\"));</script><script type=\"text/javascript\">try{var pageTracker=_gat._getTracker(\"#{id}\");pageTracker._trackPageview();}catch(err){}</script>" : ""
  end
  
  def quantcast(id, always = false)
    (always || ENV['RAILS_ENV'] == 'production') ? "<script type=\"text/javascript\">_qoptions={qacct:\"#{id}\"};</script><script type=\"text/javascript\" src=\"http://edge.quantserve.com/quant.js\"></script><noscript><img src=\"http://pixel.quantserve.com/pixel/#{id}.gif\" style=\"display:none\" border=\"0\" height=\"1\" width=\"1\" alt=\"Quantcast\"/></noscript>" : ""
  end
end
