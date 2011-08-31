class App #:nodoc: all
  class << self
    attr_reader :initial_current_directory
  end
  @initial_current_directory = Pathname.pwd
end
