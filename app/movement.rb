class Movement
  MOVEMENTS_DIRECTORY=App.my_root.join 'movement'
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
    App.my_root.join('movement').entries.select{|e| e.directory? && ?.!=e.basename.to_s[0]}.map(:basename).map{:to_s)
  #  %w[hostias]
  end
  def initialize s
    @directory=MOVEMENTS_DIRECTORY.join s
    @measure_keys, time_data = UseYaml.get_yaml_documents @directory.join 'template.yaml'
    @template=Template.new @measure_keys, time_data
    @filepaths= filepaths
  end
  def is_template filepath
    f=filepath
    x=f.extname.to_s
    'template'==f.basename.chomp x
  end
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
end
