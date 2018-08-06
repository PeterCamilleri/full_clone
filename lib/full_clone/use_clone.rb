# coding: utf-8

module FullCloneClone
  def full_clone(_progress=nil)
    clone
  end
end

class String
  include FullCloneClone
end

class Enumerator
  include FullCloneClone
end

class MatchData
  include FullCloneClone
end
