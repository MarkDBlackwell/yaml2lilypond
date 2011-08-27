uplevels = 2
project_root = File.expand_path '../'*uplevels, __FILE__
$LOAD_PATH.unshift File.join *[project_root,'lib']
## print '$LOAD_PATH.join("\n")=';print $LOAD_PATH.join("\n")

require 'test/unit'
require 'rubygems'
gem 'mocha', '= 0.9.8'
require 'mocha'

gem 'activesupport', '= 3.0.9' # Do I use this?
## require 'activesupport' # Couldn't find how; use an include statement?
