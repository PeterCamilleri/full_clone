require_relative 'deep_clone/version'
require_relative 'deep_clone/object'
require_relative 'deep_clone/array'
require_relative 'deep_clone/hash'
require_relative 'deep_clone/struct'

module DeepClone
  def deep_clone(_progress={})
    self
  end
end

class Numeric
  include DeepClone
end

class NilClass
  include DeepClone
end

class TrueClass
  include DeepClone
end

class FalseClass
  include DeepClone
end

class Symbol
  include DeepClone
end

class Regexp
  include DeepClone
end
