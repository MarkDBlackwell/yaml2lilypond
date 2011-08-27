class App #:nodoc: all
  class << self
  #  attr_reader :my_root
    attr_reader :initial_current_directory
  end
  # @my_root = Pathname(__FILE__).join('..').cleanpath.realpath.dirname
  @initial_current_directory = Pathname.pwd
end
