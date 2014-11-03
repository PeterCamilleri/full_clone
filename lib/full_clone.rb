require_relative 'full_clone/version'
require_relative 'full_clone/object'
require_relative 'full_clone/array'
require_relative 'full_clone/hash'
require_relative 'full_clone/struct'

module DeepClone
  def full_clone(_progress={})
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
