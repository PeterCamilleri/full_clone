# coding: utf-8

# Add full_clone support to all arrays.
class Array
  include FullClone

  # Do a full_clone with no exclusions
  def full_clone_no_exclusions(progress)
    each_index do |name|
      value = self[name]
      value = progress[value.object_id] || value.full_clone(progress)
      self[name] = value
    end
  end

  # Do a full_clone with exclusions
  def full_clone_with_exclusions(progress, exclude)
    each_index do |name|
      unless exclude.include?(name)
        value = self[name]
        value = progress[value.object_id] || value.full_clone(progress)
        self[name] = value
      end
    end
  end

end
