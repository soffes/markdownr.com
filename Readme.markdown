# Markdownr.com

[Markdownr.com][] is a simple website for previewing [markdown][] on the fly. [Markdownr.com][] uses the [RDiscount](http://github.com/rtomayko/rdiscount) library to parse [markdown][] input. All parsing is done inside of a Rails 3 metal controller, so it is very fast. Some styles were inspired by [GitHub](http://github.com).

[Markdownr.com][] now supports [Textile](http://redcloth.org/), [RDoc](http://rdoc.rubyforge.org/), and [Wiki](http://en.wikipedia.org/wiki/Wiki_markup). I'm currently working on improving support for these and other languages.

Feel free to visit [Markdownr.com][] or to fork and improve.

## Parsers

Here's the current line up:

    # Markdown
    gem "rdiscount", "1.6.5"
    gem "bluecloth", "2.0.7"
    gem "kramdown", "0.8.0"
    gem "maruku", "0.6.0"

    # Textile
    gem "RedCloth", "4.2.3"

    # RDoc
    gem "rdoc", "2.5.8"

    # Wiki
    gem "wikitext", "2.0"

There are obviously a ton of markdown parser. I ran some benchmarks based on [this script](http://deveiate.org/projects/BlueCloth/browser/experiments/benchmark.rb) and took away a few.

## Thanks

Huge thanks to [Yehuda Katz](http://yehudakatz.com) for all of explanations, answers to my dumb questions, and simply being awesome. Thanks to everyone who has opened issues or emailed me ideas for improvement.

[Markdownr.com]: http://markdownr.com
[markdown]: http://daringfireball.net/projects/markdown
