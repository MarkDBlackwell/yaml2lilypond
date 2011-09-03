require File.dirname(__FILE__) + '/../standalone_test_helper'

class FlattenTest < Test::Unit::TestCase

  def test_flatten
    a=[1,[2,8]]
    a=[a].flatten
    s='[1, 2, 8]'
    assert_equal s, a.inspect
  end

end
