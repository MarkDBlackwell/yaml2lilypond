class Main
  class << self
    attr_reader :three_keys
  end
  def self.extract_three_keys lilypond_variable_request
    @three_keys=[
        (lilypond_variable_request.delete 'variable'),
        (lilypond_variable_request.delete 'mode'),
        (lilypond_variable_request.delete 'prefix') ]
  end
  def self.get_sole_yaml_document filepath
    y=UseYaml.get_yaml_documents filepath
    raise unless 1==y.length # Must be exactly one yaml document.
    y.first
  end
  def self.run
    caller = caller(0)
  #print 'caller=';p caller
  #  get_movement_names.each do |movement_name|
    Movement.names.each do |movement_name|
      movement = Movement.new movement_name
      movement.filepaths.each do |filepath|
        next if movement.is_template filepath
  #      filepath=movement.directory.join filename
  ##print 'filepath.to_s=';p filepath.to_s
        lilypond_variable_request=get_sole_yaml_document filepath
        extract_three_keys lilypond_variable_request
        instrument=movement.template.clone
        run_requests instrument, lilypond_variable_request
  #      output_filepath=Pathname filepath.to_s.chomp('.yaml').concat '.rly'
        x=filepath.extname.to_s
        no_x=filepath.chomp x
        output_filepath=no_x.concat '.rly'
        Lilypond.write_input_for_lilypond movement, instrument, output_filepath
      end
    end
    run_lilypond
  end
  def self.run_lilypond
    dos_separator= '\\'
    programs_directory  = 'Program Files'
  #    programs_directory  = 'progra'
    program_location = %w[C: LilyPond usr bin lilypond-windows.exe].insert(1,programs_directory).join dos_separator
    arguments = '-dgui book.ly'
    dos_quote = '"'
  #    `#{dos_quote}#{program_location}#{dos_quote} #{arguments}`
  end
  def self.run_requests instrument, lilypond_variable_request
  #print 'instrument=';p instrument
    lilypond_variable_request.each do |measure_key,measure_request_vector|
  #print 'instrument.hash=';p instrument.hash
      begin
        m=(measure=instrument.hash.fetch measure_key)
      rescue KeyError
        raise "problem with key #{measure_key}; instrument is #{instrument}"
      end
      method_name='content' # Is default.
      until measure_request_vector.empty?
        data = measure_request_vector.shift
        (method_name=data; next) if VariableRequest.methods.include? data
        VariableRequest.execute_method method_name, measure, data
      end
    end
  end
end