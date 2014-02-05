require "filename/version"

class Filename
  attr_accessor :base, :extensions
  
  def initialize(base, *extensions)
    @base, @extensions = base.to_s, extensions.flatten.compact
  end
  
  def to_s
    @extensions.unshift(@base).join('.')
  end
  alias_method :to_path, :to_s
end