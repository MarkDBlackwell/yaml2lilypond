#@+leo-ver=4-thin
#@+node:georgesawyer.20110827101921.1508:@shadow flatten_test.rb
#@+others
#@+node:georgesawyer.20110827101921.1515:code
b=[1,[2,8]]
b.collect! do |a|
  a=[a].flatten
  2==a.length ? a : (a.push 4)
end
p b
#@nonl
#@-node:georgesawyer.20110827101921.1515:code
#@+node:georgesawyer.20110827101921.1516:prints
[[1, 4], [2, 8]]
#@nonl
#@-node:georgesawyer.20110827101921.1516:prints
#@-others
#@nonl
#@-node:georgesawyer.20110827101921.1508:@shadow flatten_test.rb
#@-leo
