#@+leo-ver=4-thin
#@+node:markdblackwell.20110823170927.1391:@shadow generate.rb
#@<< require >>
#@+node:markdblackwell.20110823170927.1392:<< require >>
require 'yaml'
require 'pathname'
s=Pathname(__FILE__).join('..').cleanpath.realpath
$LOAD_PATH.unshift s
require 'app'
require 'lily_pond'
require 'main'
require 'measure'
require 'movement'
require 'template'
require 'use_yaml'
require 'variable_request'
#@-node:markdblackwell.20110823170927.1392:<< require >>
#@nl
#@<< overall script >>
#@+node:markdblackwell.20110823170927.1394:<< overall script >>
Main.run
#@nonl
#@-node:markdblackwell.20110823170927.1394:<< overall script >>
#@nl
#@+others
#@-others
#@nonl
#@-node:markdblackwell.20110823170927.1391:@shadow generate.rb
#@-leo
