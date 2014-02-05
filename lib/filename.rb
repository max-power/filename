require "filename/version"

class Filename
  def self.parse(value)
    new *value.to_s.split('.')
  end
    
  def initialize(base, *extensions)
    @base, @extensions = base.to_s, extensions.flatten.compact
  end
  
  def to_s
    @extensions.unshift(@base).join('.')
  end
  
  alias_method  :to_path, :to_s
  attr_accessor :base, :extensions
  
  def extend_base(*values, seperator: '_')
    @base << seperator + values.map { |v| v.to_s.strip }.reject(&:empty?).join(seperator)
    self
  end
end