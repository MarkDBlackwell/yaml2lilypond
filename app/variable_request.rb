class VariableRequest #:nodoc: all
  class << self
    attr_reader :methods
  end
  @methods = (
      %w[prefix suffix].product(['',   '_barlines']) + 
      %w[content      ].product(['','_no_barlines'])
  ).map!{|a| a.join}
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
end
