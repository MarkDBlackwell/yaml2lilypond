#@+leo-ver=4-thin
#@+node:markdblackwell.20110823170927.1245:@shadow template.rb
#@+others
#@+node:markdblackwell.20110823170927.1320:Template
class Template #:nodoc: all
  #@  << constant >>
  #@+node:markdblackwell.20110823170927.1321:<< constant >>
  FIRST_MEASURE_TIME_COMPARISON_VALUE = false
  #@nonl
  #@-node:markdblackwell.20110823170927.1321:<< constant >>
  #@nl
  #@  << accessor >>
  #@+node:markdblackwell.20110823170927.1322:<< accessor >>
  attr_reader :hash, :measures
  #@nonl
  #@-node:markdblackwell.20110823170927.1322:<< accessor >>
  #@nl
  #@  @+others
  #@+node:markdblackwell.20110823170927.1323:method
  #@+node:markdblackwell.20110823170927.1324:public
  #@+node:markdblackwell.20110823170927.1326:initialize
  def initialize keys, time_data
    create_measures keys, time_data
    @hash=Hash[keys.zip @measures]
  end
  #@nonl
  #@-node:markdblackwell.20110823170927.1326:initialize
  #@+node:markdblackwell.20110823170927.1327:initialize_copy
  def initialize_copy source
    keys=@hash.keys
    @hash=Hash[keys.zip @hash.values_at(*keys).map{|e| e.dup}]
  end
  #@nonl
  #@-node:markdblackwell.20110823170927.1327:initialize_copy
  #@-node:markdblackwell.20110823170927.1324:public
  #@+node:markdblackwell.20110831105007.1551:private
  private
  #@nonl
  #@+node:georgesawyer.20110827101921.1628:flatten
  def flatten a
    a=[a].flatten # Not recursive: is Array#flatten.
    2==a.length ? a : (a.push 4)
  end
  #@nonl
  #@-node:georgesawyer.20110827101921.1628:flatten
  #@+node:markdblackwell.20110823170927.1325:create_measures
  def create_measures keys, time_data
    times=time_data.collect{|a| flatten a}
    time_same=(1...times.length).map{|i| times.at(i-1)==(times.at i)}
    time_same.unshift FIRST_MEASURE_TIME_COMPARISON_VALUE
    @measures=(keys.zip time_same, times).map{|k,ts,t| (Measure.new k,ts,t).freeze}
  end
  #@nonl
  #@-node:markdblackwell.20110823170927.1325:create_measures
  #@-node:markdblackwell.20110831105007.1551:private
  #@-node:markdblackwell.20110823170927.1323:method
  #@-others
end
#@nonl
#@-node:markdblackwell.20110823170927.1320:Template
#@-others
#@nonl
#@-node:markdblackwell.20110823170927.1245:@shadow template.rb
#@-leo
