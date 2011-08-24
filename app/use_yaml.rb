class UseYaml
  class << self
    attr_reader :extension
  end
  @extension = %w[yml] # Was 'yaml'.
  def self.get_yaml_documents filepath
    result=Array.new
    push_document=Proc.new{|e| result.push e}
    f=File.new filepath, 'r'
    YAML::load_documents f, &push_document
    f.close
    result
  end
end
