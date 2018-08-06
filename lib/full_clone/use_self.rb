# coding: utf-8

module FullCloneSelf
  def full_clone(_progress=nil)
    self
  end
end

class Numeric
  include FullCloneSelf
end

class NilClass
  include FullCloneSelf
end

class TrueClass
  include FullCloneSelf
end

class FalseClass
  include FullCloneSelf
end

class Symbol
  include FullCloneSelf
end

class Regexp
  include FullCloneSelf
end

class Thread
  include FullCloneSelf
end

