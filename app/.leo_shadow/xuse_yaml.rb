#@+leo-ver=4-thin
#@+node:markdblackwell.20110823170927.1247:@shadow use_yaml.rb
#@+others
#@+node:markdblackwell.20110823170927.1335:UseYaml
class UseYaml
  #@  << class accessor >>
  #@+node:markdblackwell.20110823170927.1336:<< class accessor >>
  class << self
    attr_reader :extension
  end
  #@nonl
  #@-node:markdblackwell.20110823170927.1336:<< class accessor >>
  #@nl
  #@  << script >>
  #@+node:markdblackwell.20110823170927.1338:<< script >>
  @extension = %w[yml] # Was 'yaml'.
  #@nonl
  #@-node:markdblackwell.20110823170927.1338:<< script >>
  #@nl
  #@  @+others
  #@+node:markdblackwell.20110823170927.1339:method
  #@+node:markdblackwell.20110823170927.1340:public class
  #@+node:markdblackwell.20110823170927.1341:get_yaml_documents
  def self.get_yaml_documents filepath
    result=Array.new
    push_document=Proc.new{|e| result.push e}
    f=File.new filepath, 'r'
    YAML::load_documents f, &push_document
    f.close
    result
  end
  #@nonl
  #@-node:markdblackwell.20110823170927.1341:get_yaml_documents
  #@-node:markdblackwell.20110823170927.1340:public class
  #@-node:markdblackwell.20110823170927.1339:method
  #@-others
end
#@nonl
#@-node:markdblackwell.20110823170927.1335:UseYaml
#@-others
#@nonl
#@-node:markdblackwell.20110823170927.1247:@shadow use_yaml.rb
#@-leo
