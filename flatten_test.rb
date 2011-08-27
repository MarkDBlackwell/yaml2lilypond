b=[1,[2,8]]
b.collect! do |a|
  a=[a].flatten
  2==a.length ? a : (a.push 4)
end
p b
[[1, 4], [2, 8]]
