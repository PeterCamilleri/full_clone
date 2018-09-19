# coding: utf-8

# Add full_clone support to all objects.
class Object
  include FullClone

  #By default, no instance variables are excluded.
  def full_clone_exclude
    []
  end

  # Do a full_clone with no exclusions
  def full_clone_no_exclusions(progress)
    instance_variables.each do |name|
      value = instance_variable_get(name)
      value = progress[value.object_id] || value.full_clone(progress)
      instance_variable_set(name, value)
    end
  end

  # Do a full_clone with exclusions
  def full_clone_with_exclusions(progress, exclude)
    instance_variables.each do |name|
      unless exclude.include?(name)
        value = instance_variable_get(name)
        value = progress[value.object_id] || value.full_clone(progress)
        instance_variable_set(name, value)
      end
    end
  end

end
