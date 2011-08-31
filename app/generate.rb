require 'yaml'
require 'pathname'
s=Pathname(__FILE__).join('..').cleanpath.realpath
$LOAD_PATH.unshift s # Isn't this already included, like '.'?
require 'app'
require 'lily_pond'
require 'main'
require 'measure'
require 'movement'
require 'template'
require 'use_yaml'
require 'variable_request'
Main.run
