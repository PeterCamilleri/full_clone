# coding: utf-8

# Add full_clone support to the struct class.
class Struct

  # Do a full_clone with no exclusions
  def full_clone_no_exclusions(progress)
    members.each do |name|
      value = self[name]
      value = progress[value.object_id] || value.full_clone(progress)
      self[name] = value
    end
  end

  # Do a full_clone with exclusions
  def full_clone_with_exclusions(progress, exclude)
    members.each do |name|
      unless exclude.include?(name)
        value = self[name]
        value = progress[value.object_id] || value.full_clone(progress)
        self[name] = value
      end
    end
  end

end
