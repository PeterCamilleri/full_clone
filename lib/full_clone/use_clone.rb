# coding: utf-8

# A mixin for cloning use Ruby clone.
module FullCloneClone
  def full_clone(_progress=nil)
    clone
  end
end

# String full clone support.
class String
  include FullCloneClone
end

# Enumerator full clone support.
class Enumerator
  include FullCloneClone
end

# Matchdata full clone support.
class MatchData
  include FullCloneClone
end
