require File.dirname(__FILE__) + '/../standalone_test_helper'

class TemplateTest < Test::Unit::TestCase

  def test_time
    b=[1,[2,8]]
    b.collect! do |a|
      a=[a].flatten
      2==a.length ? a : (a.push 4)
    end
    s='[[1, 4], [2, 8]]'
    assert_equal s, b.to_s
  end

end
