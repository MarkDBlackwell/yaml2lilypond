#@+leo-ver=4-thin
#@+node:markdblackwell.20110823170927.1243:@shadow measure.rb
#@+others
#@+node:markdblackwell.20110823170927.1298:Measure
class Measure #:nodoc: all
  #@  << constant >>
  #@+node:markdblackwell.20110823170927.1299:<< constant >>
  BAR_SYMBOL = '|'
  FILLER = 's'
  INDENT = ' '*4
  #@nonl
  #@-node:markdblackwell.20110823170927.1299:<< constant >>
  #@nl
  #@  << accessor >>
  #@+node:markdblackwell.20110823170927.1300:<< accessor >>
  attr_reader :content, :default_music, :key, :time, :time_array
  #@nonl
  #@-node:markdblackwell.20110823170927.1300:<< accessor >>
  #@nl
  #@  << single line method >>
  #@+node:markdblackwell.20110823170927.1301:<< single line method >>
  #@+others
  #@+node:markdblackwell.20110823170927.1302:content_no_barlines=
  def content_no_barlines= s; @content = s end
  #@nonl
  #@-node:markdblackwell.20110823170927.1302:content_no_barlines=
  #@+node:markdblackwell.20110823170927.1303:content=
  def content= s; @content = "#{BAR_SYMBOL} #{s} #{BAR_SYMBOL}" end
  #@nonl
  #@-node:markdblackwell.20110823170927.1303:content=
  #@+node:markdblackwell.20110823170927.1304:prefix
  def prefix s; @content = "#{s}\n" + @content end
  #@nonl
  #@-node:markdblackwell.20110823170927.1304:prefix
  #@+node:markdblackwell.20110823170927.1305:prefix_barlines
  def prefix_barlines s; @content = "#{BAR_SYMBOL} #{s} #{BAR_SYMBOL}\n" + @content end
  #@nonl
  #@-node:markdblackwell.20110823170927.1305:prefix_barlines
  #@+node:markdblackwell.20110823170927.1306:suffix
  def suffix s; @content += "\n#{s}" end
  #@nonl
  #@-node:markdblackwell.20110823170927.1306:suffix
  #@+node:markdblackwell.20110823170927.1307:suffix_barlines
  def suffix_barlines s; @content += "\n#{BAR_SYMBOL} #{s} #{BAR_SYMBOL}" end
  #@nonl
  #@-node:markdblackwell.20110823170927.1307:suffix_barlines
  #@-others
  #@-node:markdblackwell.20110823170927.1301:<< single line method >>
  #@nl
  #@  @+others
  #@+node:markdblackwell.20110823170927.1308:method
  #@+node:markdblackwell.20110823170927.1309:public
  #@+node:markdblackwell.20110823170927.1310:initialize
  def initialize k, ts, t
    @key = k
    @time_same = ts
    @time_array=[t].flatten; t = 2==t.length ? t : (t.push 4)
    count,beat = @time_array
    @time = "#{count}/#{beat}"
    @default_music = "#{FILLER}1*#{@time}"
    @content = ""#{BAR_SYMBOL} #{@default_music} #{BAR_SYMBOL}"
  end
  #@nonl
  #@-node:markdblackwell.20110823170927.1310:initialize
  #@+node:markdblackwell.20110823170927.1311:to_s
  def to_s
    time_line = @time_same ? nil : "\\time #{@time}"
    key_line = "#{INDENT}% #{@key}"
    [time_line, @content, key_line].compact.join "\n"
  end
  #@nonl
  #@-node:markdblackwell.20110823170927.1311:to_s
  #@-node:markdblackwell.20110823170927.1309:public
  #@-node:markdblackwell.20110823170927.1308:method
  #@-others
end
#@nonl
#@-node:markdblackwell.20110823170927.1298:Measure
#@-others
#@nonl
#@-node:markdblackwell.20110823170927.1243:@shadow measure.rb
#@-leo
