class Array

  #The deep_clone method for arrays.
  def deep_clone(progress={})
    progress[object_id] = result = clone
    exclude = deep_clone_exclude

    each_index.each do |name|

      unless exclude.include?(name)
        value = result[name]
        value = progress[value.object_id] || value.deep_clone(progress)
        result[name] = value
      end

    end

    result
  end

end
