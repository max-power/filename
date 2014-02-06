require "filename/version"

class Filename
  def self.parse(value)
    new *value.to_s.split('.')
  end
  
  def initialize(base, *extensions)
    @base, @extensions = clean(base), clean(extensions)
  end
  
  def suffix(*values, seperator: '_')
    @base.push(clean(values).unshift('').join(seperator)) && self
  end
  
  def prefix(*values, seperator: '_')
    @base.unshift(clean(values).push('').join(seperator)) && self
  end
  
  def to_s
    @extensions.unshift(@base.join).join('.')
  end
  
  alias_method :to_path, :to_s
  
  private
  
  def clean(input)
    Array(input).flatten.map { |v| v.to_s.strip }.reject(&:empty?)
  end
end