#@+leo-ver=4-thin
#@+node:markdblackwell.20110823170927.1354:@shadow movement.rb
#@+others
#@+node:markdblackwell.20110823170927.1366:Movement
class Movement
  #@  << constant >>
  #@+node:markdblackwell.20110823170927.1367:<< constant >>
  MOVEMENTS_DIRECTORY=App.root.join 'movement'
  #@nonl
  #@-node:markdblackwell.20110823170927.1367:<< constant >>
  #@nl
  #@  << accessor >>
  #@+node:markdblackwell.20110823170927.1368:<< accessor >>
  attr_reader :directory, :filepaths, :measure_keys, :template
  #@nonl
  #@-node:markdblackwell.20110823170927.1368:<< accessor >>
  #@nl
  #@  @+others
  #@+node:markdblackwell.20110823170927.1369:method
  #@+node:markdblackwell.20110823170927.1370:public class
  #@+node:markdblackwell.20110823170927.1371:names
  def self.names
  =begin
    result = Array.new
    App.root.join('movement').entries.each do |path|
      b = path.basename.to_s
      next unless path.directory? && ?.!=b[0]
      result << b
    end
    result
  =end
    App.root.join('movement').entries.select{|e| e.directory? && ?.!=e.basename.to_s[0]}.map(:basename).map{:to_s)
  #  %w[hostias]
  end
  #@nonl
  #@-node:markdblackwell.20110823170927.1371:names
  #@-node:markdblackwell.20110823170927.1370:public class
  #@+node:markdblackwell.20110823170927.1372:public
  #@+node:markdblackwell.20110823170927.1373:initialize
  def initialize s
    @directory=MOVEMENTS_DIRECTORY.join s
    @measure_keys, time_data = UseYaml.get_yaml_documents @directory.join 'template.yaml'
    @template=Template.new @measure_keys, time_data
    @filepaths= filepaths
  end
  #@nonl
  #@-node:markdblackwell.20110823170927.1373:initialize
  #@+node:markdblackwell.20110823170927.1374:is_template
  def is_template filepath
    f=filepath
    x=f.extname.to_s
    'template'==f.basename.chomp x
  end
  #@nonl
  #@-node:markdblackwell.20110823170927.1374:is_template
  #@-node:markdblackwell.20110823170927.1372:public
  #@+node:markdblackwell.20110823170927.1375:private
  #@+node:markdblackwell.20110823170927.1376:filepaths
  def filepaths
    result=Array.new
    no_extension=Array.new
    @directory.find do |path|
      b=path.basename.to_s
      Find.prune if path.directory? && ?.==b[0]
      next unless path.file?
      x = path.extname.to_s
  # Example: soprano/note.yaml
      if UseYaml.extension.member? x
        result << path
        no_extension << path.dirname.join(b.chomp x)
      end
    end
    no_extension=no_extension.sort
    raise unless no_extension.uniq==no_extension
    result.sort.uniq
  =begin
    %w[
        soprano/note.yaml  alto/note.yaml  tenor/note.yaml  bass/note.yaml  percussion/note.yaml
        tempo.yaml  non-reduction.yaml
        alto/non-reduction.yaml  tenor/non-reduction.yaml  
        organ/right/add.yaml  organ/left/add.yaml  
        ]
  =end
  end
  #@nonl
  #@-node:markdblackwell.20110823170927.1376:filepaths
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
