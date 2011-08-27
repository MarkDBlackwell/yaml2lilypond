class Template #:nodoc: all
  FIRST_MEASURE_TIME_COMPARISON_VALUE = false
  attr_reader :hash, :measures
  def create_measures keys, time_data
    times=time_data.collect{|a| a=[a].flatten;2==a.length ? a : (a.push 4)}
    time_same=(1...times.length).map{|i| times.at(i-1)==(times.at i)}
    time_same.unshift FIRST_MEASURE_TIME_COMPARISON_VALUE
    @measures=(keys.zip time_same, times).map{|k,ts,t| (Measure.new k,ts,t).freeze}
  end
  def initialize keys, time_data
    create_measures keys, time_data
    @hash=Hash[keys.zip @measures]
  end
  def initialize_copy source
    keys=@hash.keys
    @hash=Hash[keys.zip @hash.values_at(*keys).map{|e| e.dup}]
  end
end
