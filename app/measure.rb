class Measure #:nodoc: all
  BAR_SYMBOL = '|'
  FILLER = 's'
  INDENT = ' '*4
  attr_reader :content, :default_music, :key, :time, :time_array
  def content_no_barlines= s; @content = s end
  def content= s; @content = "#{BAR_SYMBOL} #{s} #{BAR_SYMBOL}" end
  def prefix s; @content = "#{s}\n" + @content end
  def prefix_barlines s; @content = "#{BAR_SYMBOL} #{s} #{BAR_SYMBOL}\n" + @content end
  def suffix s; @content += "\n#{s}" end
  def suffix_barlines s; @content += "\n#{BAR_SYMBOL} #{s} #{BAR_SYMBOL}" end
  def initialize k, ts, t
    @key = k
    @time_same = ts
    @time_array=[t].flatten; t = 2==t.length ? t : (t.push 4)
    count,beat = @time_array
    @time = "#{count}/#{beat}"
    @default_music = "#{FILLER}1*#{@time}"
    @content = "#{BAR_SYMBOL} #{@default_music} #{BAR_SYMBOL}"
  end
  def to_s
    time_line = @time_same ? nil : "\\time #{@time}"
    key_line = "#{INDENT}% #{@key}"
    [key_line, time_line, @content].compact.join "\n"
  end
end
