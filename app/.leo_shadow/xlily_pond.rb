#@+leo-ver=4-thin
#@+node:markdblackwell.20110823170927.1239:@shadow lily_pond.rb
#@+others
#@+node:markdblackwell.20110823170927.1258:LilyPond
class LilyPond #:nodoc: all
  #@  << constant >>
  #@+node:markdblackwell.20110823170927.1259:<< constant >>
  INDENT = ' '*2
  LILYPOND_VERSION='2.14.2'
  OUTPUT_EXTENSION='.gly'
  #@nonl
  #@-node:markdblackwell.20110823170927.1259:<< constant >>
  #@nl
  #@  @+others
  #@+node:markdblackwell.20110823170927.1260:method
  #@+node:markdblackwell.20110823170927.1261:public class
  #@+node:markdblackwell.20110826175603.1481:output_extension
  def self.output_extension; OUTPUT_EXTENSION end
  #@nonl
  #@-node:markdblackwell.20110826175603.1481:output_extension
  #@+node:markdblackwell.20110823170927.1262:rest
  def self.rest; rest='r1*' end
  #@nonl
  #@-node:markdblackwell.20110823170927.1262:rest
  #@+node:markdblackwell.20110823170927.1263:write_input_for_lilypond
  def self.write_input_for_lilypond movement, instrument, filepath
    lilypond_variable_name, mode, overall_prefix = Main.three_keys
    a=Array.new
    a.push %Q@\\version "#{LILYPOND_VERSION}"@
    a.push "% This file was autogenerated. DO NOT MODIFY.\n"
    a.push "#{lilypond_variable_name} = {"
    a.push "#{INDENT}\\#{mode} {" # Keep a separate line, as may contain a LilyPond line comment.
    overall_prefix.each{|e| a.push "#{INDENT}#{INDENT}#{e}"} unless overall_prefix.nil?
    a.push instrument.hash.values_at(*movement.measure_keys).map{|e| e.to_s}.join "\n" # Value is Measure.
    a.push "#{INDENT}}"
    a.push "}"
    s=a.join "\n"
    f=File.new filepath, 'wb' # Use Unix (LF) line endings.
    f.print s, "\n"
    f.close
  end
  #@nonl
  #@-node:markdblackwell.20110823170927.1263:write_input_for_lilypond
  #@-node:markdblackwell.20110823170927.1261:public class
  #@-node:markdblackwell.20110823170927.1260:method
  #@-others
end
#@nonl
#@-node:markdblackwell.20110823170927.1258:LilyPond
#@-others
#@nonl
#@-node:markdblackwell.20110823170927.1239:@shadow lily_pond.rb
#@-leo
