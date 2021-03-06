=begin
Author: Mark D. Blackwell
Date created: July 17, 2011
Date changed: July 19, 2011
2011-7-19 Some cleanup.

Purpose: TODO
Example usage: TODO
====================
See:
http://corelib.rubyonrails.org/classes/YAML.html
http://creedcultcode.blogspot.com/2008/05/parsing-yaml-files-in-ruby.html
http://en.wikipedia.org/wiki/YAML
http://rhnh.net/2006/06/25/yaml-tutorial
http://rhnh.net/2011/01/31/yaml-tutorial
http://www.ruby-doc.org/stdlib/libdoc/yaml/rdoc/index.html
http://www.yaml.org/YAML_for_ruby.html
http://www.yaml.org/spec/1.0/#id2491593
http://yaml4r.sourceforge.net/doc/

For clone method for deep copies, see:
http://ruby.about.com/od/advancedruby/a/deepcopy.htm
http://blog.rubybestpractices.com/posts/rklemme/018-Complete_Class.html
====================
Examples:
--------------------
Measure key:
Where a word continues out of the measure:
--- # Measure keys
- Go-(ing)
Where a word is continued into the measure:
--- # Measure keys
- (Com)-ing
Where a syllable continues out of the measure:
--- # Measure keys
- One--
Where a syllable is continued into the measure:
--- # Measure keys
- --One
Where a syllable continues both into and out of the measure:
--- # Measure keys
- --One--
--------------------
Time signature:
--- # Measure times
# With quarter note beats:
- 3
When the beat is other than a quarter note:
- - 5
  - 2
====================
Tests:
--------------------
Code:
b=[1,[2,8]]
b.collect!{|a| a=[a].flatten;2==a.length ? a : (a.push 4)}
p b
Prints:
[[1, 4], [2, 8]]
--------------------
Code:
s=[1,[2,3],4].to_yaml
print s
tree=YAML::parse(s)
p tree.transform
YAML::parse(s){|d| print d.inspect, "\n"}
Prints:
---
- 1
- - 2
  - 3
- 4
[1, [2, 3], 4]
--------------------
Code:
k='(Requi)-emAeternam'
test_instrument[k].content_no_barlines='hello'
        print test_instrument[k].content, "\n"
test_instrument[k].content='c4 d e f'
        print test_instrument[k].content, "\n"
test_instrument[k].content="r*#{test_instrument[k].time}"
        print test_instrument[k].content, "\n"
Prints:
hello
| c4 d e f |
| r*12/4 |
--------------------
Code:
a=[1,2];a.unshift(3);p a
Prints:
[3, 1, 2]
====================
=end

require 'yaml'
require 'pathname'

class App
  class << self
    attr_reader :root
  end
  @root = Pathname(__FILE__).join('..').cleanpath.realpath.dirname
end

class UseYaml
  def self.get_yaml_documents filepath
    result=Array.new
    push_document=Proc.new{|e| result.push e}
    f=File.new filepath, 'r'
    YAML::load_documents f, &push_document
    f.close
    result
  end

end

class Measure
  BAR_SYMBOL = '|'
  FILLER = 's'
  INDENT = ' '*4
  attr_reader :content, :time, :time_array

  def initialize k, ts, t
    @key = k
    @time_same = ts
    @time_array=[t].flatten; t = 2==t.length ? t : (t.push 4)
    count,beat = @time_array
    @time = "#{count}/#{beat}"
    default_music = "#{BAR_SYMBOL} #{FILLER}1*#{@time} #{BAR_SYMBOL}"
    @content = default_music
  end

  def to_s
    time_line = @time_same ? nil : "\\time #{@time}"
    key_line = "#{INDENT}% #{@key}"
    [time_line, @content, key_line].compact.join "\n"
  end

  def content_no_barlines= s; @content  =                    s                              end
  def content=             s; @content  =   "#{BAR_SYMBOL} #{s} #{BAR_SYMBOL}"              end
  def prefix               s; @content  =                 "#{s}\n"               + @content end
  def prefix_barlines      s; @content  =   "#{BAR_SYMBOL} #{s} #{BAR_SYMBOL}\n" + @content end
  def suffix               s; @content +=               "\n#{s}"                            end
  def suffix_barlines      s; @content += "\n#{BAR_SYMBOL} #{s} #{BAR_SYMBOL}"              end

end

class Template
  FIRST_MEASURE_TIME_COMPARISON_VALUE = false
  attr_reader :hash, :measures

  def initialize keys, time_data
    create_measures keys, time_data
    @hash=Hash[keys.zip @measures]
  end

  def create_measures keys, time_data
    times=time_data.collect{|a| a=[a].flatten;2==a.length ? a : (a.push 4)}
    time_same=(1...times.length).map{|i| times.at(i-1)==(times.at i)}
    time_same.unshift FIRST_MEASURE_TIME_COMPARISON_VALUE
    @measures=(keys.zip time_same, times).map{|k,ts,t| (Measure.new k,ts,t).freeze}
  end

  def initialize_copy(source)
    keys=@hash.keys
    @hash=Hash[keys.zip @hash.values_at(*keys).map{|e| e.dup}]
  end

end

class Movement
  MOVEMENTS_DIRECTORY=App.root.join 'movement'
  attr_reader :directory, :measure_keys, :template

  def initialize s
    @directory=MOVEMENTS_DIRECTORY.join s
    @measure_keys, time_data = UseYaml.get_yaml_documents @directory.join 'template.yaml'
    @template=Template.new @measure_keys, time_data
  end

end

class VariableRequest
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

class Lilypond
  LILYPOND_VERSION='2.14.1'
  INDENT = ' '*2

  def self.rest;  rest='r1*'  end

  def self.write_input_for_lilypond movement, instrument, filepath
    lilypond_variable_name, mode, overall_prefix = Main.three_keys
    a=Array.new
    a.push %Q@\\version "#{LILYPOND_VERSION}"@
    a.push "% This file was autogenerated. DO NOT MODIFY.\n"
    a.push "#{lilypond_variable_name} = {"
    a.push "#{INDENT}\\#{mode} {"
    overall_prefix.each{|e| a.push "#{INDENT}#{INDENT}#{e}"} unless overall_prefix.nil?
    a.push instrument.hash.values_at(*movement.measure_keys).map{|e| e.to_s}.join "\n"
    a.push "#{INDENT}}"
    a.push "}"
    s=a.join "\n"
    f=File.new filepath, 'w'
    f.print s, "\n"
    f.close
  end

end

class Main
  class << self
    attr_reader :three_keys
  end

  def self.get_movement_names
    %w[hostias]
  end

  def self.get_filenames
    %w[
        soprano/note.yaml  alto/note.yaml  tenor/note.yaml  bass/note.yaml  percussion/note.yaml
        tempo.yaml  non-reduction.yaml
        alto/non-reduction.yaml  tenor/non-reduction.yaml  
        organ/right/add.yaml  organ/left/add.yaml  
        ]
#    ['percussion/note.yaml'] # Test.
  end

  def self.get_sole_yaml_document filepath
    y=UseYaml.get_yaml_documents filepath
    raise unless 1==y.length # Must be exactly one yaml document.
    y.first
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

  def self.extract_three_keys lilypond_variable_request
    @three_keys=[
        (lilypond_variable_request.delete 'variable'),
        (lilypond_variable_request.delete 'mode'),
        (lilypond_variable_request.delete 'prefix') ]
  end

# Look at this for finding yaml files:
=begin
    app_root
App.root.join(*TEST_GROUP).find do |path|
  b=path.basename.to_s
  Find.prune if path.directory? && ?.==b[0]
  paths << path.dirname.join(b.chomp '.rb') if REQUIRE_TEST_BASENAME==b
end
=end

  def self.run_lilypond
    dos_separator= '\\'
    programs_directory  = 'Program Files'
#    programs_directory  = 'progra'
    program_location = %w[C: LilyPond usr bin lilypond-windows.exe].insert(1,programs_directory).join dos_separator
    arguments = '-dgui book.ly'
    dos_quote = '"'
#    `#{dos_quote}#{program_location}#{dos_quote} #{arguments}`
  end

  def self.run
    caller = caller(0)
#print 'caller=';p caller
    get_movement_names.each do |movement_name|
      movement = Movement.new movement_name
      get_filenames.each do |filename|
        next if 'template.yaml'==filename
        filepath=movement.directory.join filename
#print 'filepath.to_s=';p filepath.to_s
        lilypond_variable_request=get_sole_yaml_document filepath
        extract_three_keys lilypond_variable_request
        instrument=movement.template.clone
        run_requests instrument, lilypond_variable_request
        output_filepath=Pathname filepath.to_s.chomp('.yaml').concat '.rly'
        Lilypond.write_input_for_lilypond movement, instrument, output_filepath
      end
    end
    run_lilypond
  end

end

Main.run
