#@+leo-ver=4-thin
#@+node:markdblackwell.20110823170927.1249:@shadow variable_request.rb
#@+others
#@+node:markdblackwell.20110823170927.1348:VariableRequest
class VariableRequest #:nodoc: all
  #@  << class accessor >>
  #@+node:markdblackwell.20110823170927.1349:<< class accessor >>
  class << self
    attr_reader :methods
  end
  #@nonl
  #@-node:markdblackwell.20110823170927.1349:<< class accessor >>
  #@nl
  #@  << script >>
  #@+node:markdblackwell.20110823170927.1350:<< script >>
  @methods = (
      %w[prefix suffix].product(['',   '_barlines']) + 
      %w[content      ].product(['','_no_barlines'])
  ).map!{|a| a.join}
  #@nonl
  #@-node:markdblackwell.20110823170927.1350:<< script >>
  #@nl
  #@  @+others
  #@+node:markdblackwell.20110823170927.1351:method
  #@+node:markdblackwell.20110823170927.1352:public class
  #@+node:markdblackwell.20110823170927.1353:execute_method
  def self.execute_method method_name, measure, data
    m,d = measure,data
    case method_name
    when 'content'; m.content=d
    when 'prefix'; m.prefix d
    when 'suffix'; m.suffix d
    when 'content_no_barlines'; m.content_no_barlines=d
    when 'prefix_barlines'; m.prefix_barlines d
    when 'suffix_barlines'; m.suffix_barlines d
    else raise 'what?' end
  end
  #@nonl
  #@-node:markdblackwell.20110823170927.1353:execute_method
  #@-node:markdblackwell.20110823170927.1352:public class
  #@-node:markdblackwell.20110823170927.1351:method
  #@-others
end
#@nonl
#@-node:markdblackwell.20110823170927.1348:VariableRequest
#@-others
#@nonl
#@-node:markdblackwell.20110823170927.1249:@shadow variable_request.rb
#@-leo
