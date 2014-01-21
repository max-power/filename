require "filename/version"

class Filename
  def initialize(base, *extensions)
    @base, @extensions = base, extensions.flatten.compact
  end
  
  def to_s
    @extensions.unshift(@base).join('.')
  end
  alias_method :to_path, :to_s
end