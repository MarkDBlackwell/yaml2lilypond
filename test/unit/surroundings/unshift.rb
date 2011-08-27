require File.dirname(__FILE__) + '/../standalone_test_helper'

class UnshiftTest < Test::Unit::TestCase

  def test_unshift
    a=[1,2]
    a.unshift(3)
    s='[3, 1, 2]'
    assert_equal s, a.to_s
  end

end
