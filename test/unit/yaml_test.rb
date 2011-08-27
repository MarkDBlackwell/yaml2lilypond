s=[1,[2,3],4].to_yaml
print s
tree=YAML::parse(s)
p tree.transform
YAML::parse(s){|d| print d.inspect, "\n"}
---
- 1
- - 2
  - 3
- 4
[1, [2, 3], 4]
