#@+leo-ver=4-thin
#@+node:georgesawyer.20110827101921.1509:@shadow yaml_test.rb
#@+others
#@+node:georgesawyer.20110827101921.1513:code
s=[1,[2,3],4].to_yaml
print s
tree=YAML::parse(s)
p tree.transform
YAML::parse(s){|d| print d.inspect, "\n"}
#@-node:georgesawyer.20110827101921.1513:code
#@+node:georgesawyer.20110827101921.1514:prints
---
- 1
- - 2
  - 3
- 4
[1, [2, 3], 4]
#@nonl
#@-node:georgesawyer.20110827101921.1514:prints
#@-others
#@nonl
#@-node:georgesawyer.20110827101921.1509:@shadow yaml_test.rb
#@-leo
