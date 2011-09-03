#@+leo-ver=4-thin
#@+node:georgesawyer.20110827101921.1508:@shadow flatten_test.rb
require File.dirname(__FILE__) + '/../standalone_test_helper'

class FlattenTest < Test::Unit::TestCase

  def test_flatten
    a=[1,[2,8]]
    a=[a].flatten
    s='[1, 2, 8]'
    assert_equal s, a.inspect
  end

end
#@nonl
#@-node:georgesawyer.20110827101921.1508:@shadow flatten_test.rb
#@-leo
