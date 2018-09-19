# coding: utf-8

# A mixin for cloning as self.
module FullCloneSelf
  def full_clone(_progress=nil)
    self
  end
end

# Numeric supports full clone.
class Numeric
  include FullCloneSelf
end

# NilClass supports full clone.
class NilClass
  include FullCloneSelf
end

# TrueClass supports full clone.
class TrueClass
  include FullCloneSelf
end

# FalseClass supports full clone.
class FalseClass
  include FullCloneSelf
end

# Symbols support full clone.
class Symbol
  include FullCloneSelf
end

# Regular expressions support full clone.
class Regexp
  include FullCloneSelf
end

# Threads support full clone.
class Thread
  include FullCloneSelf
end
