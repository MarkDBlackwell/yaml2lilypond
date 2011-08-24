class Movement
# MOVEMENTS_DIRECTORY=App.my_root.join 'movement'
MOVEMENTS_DIRECTORY=Pathname.pwd.join 'movement'
attr_reader :directory, :filepaths, :measure_keys, :template
def self.names
=begin
  result = Array.new
  App.my_root.join('movement').entries.each do |path|
    b = path.basename.to_s
    next unless path.directory? && ?.!=b[0]
    result << b
  end
  result
=end
#  App.my_root.join('movement').entries.select{|e| e.directory? && ?.!=e.basename.to_s[0]}.map(&:basename).map(&:to_s)

##print 'MOVEMENTS_DIRECTORY.to_s=';p MOVEMENTS_DIRECTORY.to_s
  MOVEMENTS_DIRECTORY.entries.select do |e|
##print 'e.to_s=';p e.to_s
     MOVEMENTS_DIRECTORY.join(e).directory? && ?.!=e.to_s[0]
  end.map(&:to_s)
#  %w[hostias]
end
def initialize s
##print 's=';p s
  @directory=MOVEMENTS_DIRECTORY.join s
  a = UseYaml.get_yaml_documents @directory.join 'template.yaml'
##print 'a.inspect=';p a.inspect
  a=a.map{|e| e.nil? ? [] : e}
  @measure_keys, time_data = a
##print '@measure_keys=';p @measure_keys
##print 'time_data=';p time_data
  @template=Template.new @measure_keys, time_data
  @filepaths=get_filepaths
end
def is_template filepath
  f=filepath
  x=f.extname
  'template'==(f.basename.to_s.chomp x)
end
private
def get_filepaths
  result=Array.new
  no_extension=Array.new
  @directory.find do |path|
    b=path.basename.to_s
    Find.prune if path.directory? && ?.==b[0]
    next unless path.file?
    x = path.extname.to_s
## print 'x=';p x
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
=begin
  %w[
      soprano/note.yaml  alto/note.yaml  tenor/note.yaml  bass/note.yaml  percussion/note.yaml
      tempo.yaml  non-reduction.yaml
      alto/non-reduction.yaml  tenor/non-reduction.yaml  
      organ/right/add.yaml  organ/left/add.yaml  
      ]
=end
end
end
