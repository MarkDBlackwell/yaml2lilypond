#@+leo-ver=4-thin
#@+node:markdblackwell.20110823170927.1382:@shadow app.rb
#@+others
#@+node:markdblackwell.20110823170927.1383:App
class App #:nodoc: all
  #@  << class accessor >>
  #@+node:markdblackwell.20110823170927.1384:<< class accessor >>
  class << self
    attr_reader :my_root
  end
  #@nonl
  #@-node:markdblackwell.20110823170927.1384:<< class accessor >>
  #@nl
  #@  << script >>
  #@+node:markdblackwell.20110823170927.1386:<< script >>
  @my_root = Pathname(__FILE__).join('..').cleanpath.realpath.dirname
  #@nonl
  #@-node:markdblackwell.20110823170927.1386:<< script >>
  #@nl
  #@  @+others
  #@-others
end
#@nonl
#@-node:markdblackwell.20110823170927.1383:App
#@-others
#@nonl
#@-node:markdblackwell.20110823170927.1382:@shadow app.rb
#@-leo
