#@+leo-ver=4-thin
#@+node:markdblackwell.20110823170927.1354:@shadow movement.rb
#@+others
#@+node:markdblackwell.20110823170927.1366:Movement
class Movement
#@<< constant >>
#@+node:markdblackwell.20110823170927.1367:<< constant >>
MOVEMENTS_DIRECTORY=Pathname.pwd.join 'movement'
#@-node:markdblackwell.20110823170927.1367:<< constant >>
#@nl
#@<< accessor >>
#@+node:markdblackwell.20110823170927.1368:<< accessor >>
attr_reader :directory, :filepaths, :measure_keys, :template
#@nonl
#@-node:markdblackwell.20110823170927.1368:<< accessor >>
#@nl
#@+others
#@+node:markdblackwell.20110823170927.1369:method
#@+node:markdblackwell.20110823170927.1370:public class
#@+node:markdblackwell.20110823170927.1371:names
# Example: ['hostias']

def self.names
##print 'MOVEMENTS_DIRECTORY.to_s=';p MOVEMENTS_DIRECTORY.to_s
  MOVEMENTS_DIRECTORY.entries.select do |e|
##print 'e.to_s=';p e.to_s
     MOVEMENTS_DIRECTORY.join(e).directory? && ?.!=e.to_s[0]
  end.map(&:to_s)
end
#@nonl
#@-node:markdblackwell.20110823170927.1371:names
#@-node:markdblackwell.20110823170927.1370:public class
#@+node:markdblackwell.20110823170927.1372:public
#@+node:markdblackwell.20110823170927.1373:initialize
def initialize s
##print 's=';p s
  @directory=MOVEMENTS_DIRECTORY.join s
  a = UseYaml.get_yaml_documents @directory.join 'template.yml'
##print 'a.inspect=';p a.inspect
  a=a.map{|e| e.nil? ? [] : e}
  @measure_keys, time_data = a
##print '@measure_keys=';p @measure_keys
##print 'time_data=';p time_data
  @template=Template.new @measure_keys, time_data
  @filepaths=get_filepaths
end
#@nonl
#@-node:markdblackwell.20110823170927.1373:initialize
#@+node:markdblackwell.20110823170927.1374:is_template
def is_template filepath
  f=filepath
  x=f.extname
  'template'==(f.basename.to_s.chomp x)
end
#@nonl
#@-node:markdblackwell.20110823170927.1374:is_template
#@-node:markdblackwell.20110823170927.1372:public
#@+node:markdblackwell.20110823170927.1375:private
private
#@nonl
#@+node:markdblackwell.20110823170927.1376:get_filepaths
def get_filepaths
  result=Array.new
  no_extension=Array.new
  @directory.find do |path|
    b=path.basename.to_s
    Find.prune if path.directory? && ?.==b[0]
    next unless path.file?
    x = path.extname.to_s
##print 'x=';p x
# Example: soprano/note.yaml
    s=(! x.start_with? '.') ? x : x[1..-1]
    if UseYaml.extension.member? s
##print 'path.inspect=';p path.inspect
      result << path
      no_extension << path.dirname.join(b.chomp x)
    end
  end
  no_extension=no_extension.sort
  raise unless no_extension.uniq==no_extension
  result.sort.uniq
end
#@nonl
#@-node:markdblackwell.20110823170927.1376:get_filepaths
#@-node:markdblackwell.20110823170927.1375:private
#@-node:markdblackwell.20110823170927.1369:method
#@-others
end
#@nonl
#@-node:markdblackwell.20110823170927.1366:Movement
#@-others
#@nonl
#@-node:markdblackwell.20110823170927.1354:@shadow movement.rb
#@-leo
