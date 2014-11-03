require_relative 'full_clone/version'
require_relative 'full_clone/object'
require_relative 'full_clone/array'
require_relative 'full_clone/hash'
require_relative 'full_clone/struct'

module FullClone
  def full_clone(_progress={})
    self
  end
end

class Numeric
  include FullClone
end

class NilClass
  include FullClone
end

class TrueClass
  include FullClone
end

class FalseClass
  include FullClone
end

class Symbol
  include FullClone
end

class Regexp
  include FullClone
end
