require "filename/version"

class Filename
  def initialize(base, extensions=nil)
    @base, @extensions = base, Array(extensions)
  end
  
  def to_s
    @extensions.compact.unshift(@base).join('.')
  end
  alias_method :to_path, :to_s
end