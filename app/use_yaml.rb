class UseYaml #:nodoc: all
  class << self
    attr_reader :extension
  end
  @extension = %w[yml]
  def self.get_yaml_documents filepath, required_number_of_yaml_documents
    r = required_number_of_yaml_documents
    result=Array.new
    push_document=Proc.new{|e| result.push e}
    f=File.new filepath, 'r'
    YAML::load_documents f, &push_document
    f.close
    raise "#{filepath} must have #{r} YAML documents, #{result.length} found." unless r==result.length
    result
  end
end
