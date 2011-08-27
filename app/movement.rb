class Movement #:nodoc: all
  MOVEMENTS_DIRECTORY=App.initial_current_directory
  attr_reader :directory, :filepaths, :measure_keys, :template
  # Example: ['hostias']
  def self.names
  ##print 'MOVEMENTS_DIRECTORY.to_s=';p MOVEMENTS_DIRECTORY.to_s
    MOVEMENTS_DIRECTORY.entries.select do |e|
  ##print 'e.to_s=';p e.to_s
       MOVEMENTS_DIRECTORY.join(e).directory? && ?.!=e.to_s[0]
    end.map(&:to_s)
  end
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
  def is_template filepath
    f=filepath
    x=f.extname
    'template'==(f.basename.to_s.chomp x)
  end
  private
  # Example: soprano/note.yml
  def get_filepaths
    result=Array.new
    no_extension=Array.new
    @directory.find do |path|
      b=path.basename.to_s
      Find.prune if path.directory? && ?.==b[0]
      next unless path.file?
      x = path.extname.to_s
  ##print 'x=';p x
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
end
