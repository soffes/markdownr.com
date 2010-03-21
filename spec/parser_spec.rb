require 'spec_helper'

module MarkdownrParserSpecHelper
  def mp(text)
    Markdownr::Parser.preprocess(text)
  end
end

describe Markdownr::Parser, "GitHub flavored markdown" do
  include MarkdownrParserSpecHelper
  
  it "should not touch single underscores inside words" do
    "foo_bar".should eql mp("foo_bar")
  end

  it "should not touch underscores in code blocks" do
    "    foo_bar_baz".should eql mp("    foo_bar_baz")
  end
  
  it "should not touch underscores in pre blocks" do
    "\n\n<pre>\nfoo_bar_baz\n</pre>".should eql mp("<pre>\nfoo_bar_baz\n</pre>")
  end
  
  it "should not treat pre blocks with pre-text differently" do
    a = "\n\n<pre>\nthis is `a\\_test` and this\\_too\n</pre>"
    b = "hmm<pre>\nthis is `a\\_test` and this\\_too\n</pre>"
    mp(a)[2..-1].should eql mp(b)[3..-1]
  end
  
  it "should escape two or more underscores inside words" do
    "foo\\_bar\\_baz".should eql mp("foo_bar_baz")
  end
  
  it "should turn newlines into br tags in simple cases" do
    "foo  \nbar".should eql mp("foo\nbar")
  end
  
  it "should convert newlines in all groups" do
    "apple  \npear  \norange\n\nruby  \npython  \nerlang".should eql mp("apple\npear\norange\n\nruby\npython\nerlang")
  end
  
  it "should convert newlines in even long groups" do
    "apple  \npear  \norange  \nbanana\n\nruby  \npython  \nerlang".should eql mp("apple\npear\norange\nbanana\n\nruby\npython\nerlang")
  end
  
  it "should not convert newlines in lists" do
    "# foo\n# bar".should eql mp("# foo\n# bar")
    "* foo\n* bar".should eql mp("* foo\n* bar")
  end
end

describe Markdownr::Parser, "XSS protection" do
  include MarkdownrParserSpecHelper
  
  it "should strip <script> tags" do
    ''.should eql mp("<script>alert('rawr')</script>")
  end
  
  it "should not allow javascript: in href" do
    '<a href="javascript:;">foo</a>'.should eql mp('<a href="javascript:alert(\'bar\')">foo</a>')
  end
  
  it "should strip HTML event attributes" do
    '<a href="http://samsoff.es">awesome</a>'.should eql mp('<a href="http://samsoff.es" onclick="alert(\'rawr\')">awesome</a>')
  end
  
end