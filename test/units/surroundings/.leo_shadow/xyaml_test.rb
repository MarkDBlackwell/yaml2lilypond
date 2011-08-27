#@+leo-ver=4-thin
#@+node:georgesawyer.20110827101921.1509:@shadow yaml_test.rb
require File.dirname(__FILE__) + '/../standalone_test_helper'
require 'yaml'

class YamlTest < Test::Unit::TestCase

  def test_to_yaml
    assert_equal <<-YAML.gsub(/^ {6}/, ''), @s
      ---
      - 1
      - - 2
        - 3
      - 4
    YAML
  end

  def test_yaml_transform
## YAML::parse(s){|d| print d.inspect, "\n"}
    tree=YAML::parse @s
    s=tree.transform
    assert_equal @a, s
  end

#--------------
  private

  def setup
    @a = [1,[2,3],4]
    @s = @a.to_yaml
  end
end
#@nonl
#@-node:georgesawyer.20110827101921.1509:@shadow yaml_test.rb
#@-leo
