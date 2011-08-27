class App #:nodoc: all
  class << self
    attr_reader :my_root
  end
  @my_root = Pathname(__FILE__).join('..').cleanpath.realpath.dirname
end
