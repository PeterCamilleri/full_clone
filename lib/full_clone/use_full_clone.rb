# coding: utf-8

# A mixin for cloning use full clone.
module FullClone
  #The common part of the full_clone method.
  def full_clone(progress={})
    progress[object_id] = result = clone
    exclude = full_clone_exclude

    if exclude.empty?
      result.full_clone_no_exclusions(progress)
    else
      result.full_clone_with_exclusions(progress, exclude)
    end

    result
  end
end

