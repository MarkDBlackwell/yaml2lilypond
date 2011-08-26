#@+leo-ver=4-thin
#@+node:markdblackwell.20110823170927.1241:@shadow main.rb
#@+others
#@+node:markdblackwell.20110823170927.1274:Main
class Main
  #@  << class accessor >>
  #@+node:markdblackwell.20110823170927.1275:<< class accessor >>
  class << self
    attr_reader :three_keys
  end
  #@nonl
  #@-node:markdblackwell.20110823170927.1275:<< class accessor >>
  #@nl
  #@  @+others
  #@+node:markdblackwell.20110823170927.1277:method
  #@+node:markdblackwell.20110823170927.1278:public class
  #@+node:markdblackwell.20110823170927.1279:extract_three_keys
  def self.extract_three_keys lilypond_variable_request
    @three_keys=[
        (lilypond_variable_request.delete 'variable'),
        (lilypond_variable_request.delete 'mode'),
        (lilypond_variable_request.delete 'prefix') ]
  end
  #@nonl
  #@-node:markdblackwell.20110823170927.1279:extract_three_keys
  #@+node:markdblackwell.20110823170927.1280:get_sole_yaml_document
  def self.get_sole_yaml_document filepath
    y=UseYaml.get_yaml_documents filepath
    raise unless 1==y.length # Must be exactly one yaml document.
    y.first
  end
  #@nonl
  #@-node:markdblackwell.20110823170927.1280:get_sole_yaml_document
  #@+node:markdblackwell.20110823170927.1281:run
  def self.run
    caller = caller(0)
  ##print 'caller=';p caller
  ##print 'Movement.names=';p Movement.names
    Movement.names.each do |movement_name|
      movement = Movement.new movement_name
  ##print 'movement.filepaths.inspect=';p movement.filepaths.inspect
      movement.filepaths.each do |filepath|
  ##print 'filepath.to_s=';p filepath.to_s
        next if movement.is_template filepath
  ##print 'filepath.to_s=';p filepath.to_s
        lilypond_variable_request=get_sole_yaml_document filepath
        extract_three_keys lilypond_variable_request
        instrument=movement.template.clone
        run_requests instrument, lilypond_variable_request
        x=filepath.extname
        no_x=filepath.to_s.chomp x
  #      output_filepath=no_x.concat '.rly'
        output_filepath=no_x.concat LilyPond.output_extension
  ##print 'output_filepath.to_s=';p output_filepath.to_s
        Lilypond.write_input_for_lilypond movement, instrument, output_filepath
      end
    end
    run_lilypond
  end
  #@nonl
  #@-node:markdblackwell.20110823170927.1281:run
  #@+node:markdblackwell.20110823170927.1282:run_lilypond
  def self.run_lilypond
    dos_separator= '\\'
    programs_directory  = 'Program Files'
  ##    programs_directory  = 'progra'
    program_location = %w[C: LilyPond usr bin lilypond-windows.exe].insert(1,programs_directory).join dos_separator
    arguments = '-dgui book.ly'
    dos_quote = '"'
  ##    `#{dos_quote}#{program_location}#{dos_quote} #{arguments}`
  end
  #@nonl
  #@-node:markdblackwell.20110823170927.1282:run_lilypond
  #@+node:markdblackwell.20110823170927.1283:run_requests
  def self.run_requests instrument, lilypond_variable_request
  ##print 'instrument=';p instrument
    lilypond_variable_request.each do |measure_key,measure_request_vector|
  ##print 'instrument.hash=';p instrument.hash
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
  #@nonl
  #@-node:markdblackwell.20110823170927.1283:run_requests
  #@-node:markdblackwell.20110823170927.1278:public class
  #@-node:markdblackwell.20110823170927.1277:method
  #@-others
end
#@nonl
#@-node:markdblackwell.20110823170927.1274:Main
#@-others
#@nonl
#@-node:markdblackwell.20110823170927.1241:@shadow main.rb
#@-leo
