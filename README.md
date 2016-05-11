# FullClone

The standard clone method creates a fresh instance of most (non-scalar) objects
but does not clone internal state. This internal state remains aliased in the
cloned copy. The full_clone method digs deep and makes copies of these internal
variables, not just arrays and hashes. It also allows classes to specify an
exclusion list of variables that are not to be processed.

This comprehensive approach creates another issue to be resolved. In Ruby, if an
attempt is made to clone an immutable data item like a number, an error occurs.
The justification for this uncharacteristic strictness is not at all clear, but
it does mean that the clone operation must be applied with great care.

Unlike the standard clone method, the full\_clone method does not throw an
exception when it sees un-clonable value objects like 42 or true. These values
simply return themselves. This is correct because those types of objects do
not _need_ to be cloned. Instead of having a fit, the code just works!

Another issue that this gem deals with is that of data with looping reference
chains. To handle this, the code tracks object ID values and does not re-clone
data that has already been cloned. Thus even nasty edge cases are handled
without any special effort on the part of the application programmer.

## Family Overview

This gem is a member of a family of four gems that all provide data copying
services in a safe, easy to use format. The following outlines the available
gems and how to chose from among them.

Depth / Action | Need to copy all. | Need to copy data only.
---------------|------------------------------|------------
Need a shallow copy | require 'safe\_clone' | require 'safe\_dup'
Need a full copy    | require 'full\_clone' | require 'full\_dup'

<br>**Notes**
* Since none of these gems override the default clone and dup
methods, the default behaviors remain available. Further, if multiple,
differing requirements exists, more than one family member gem may be
employed in the same project without fear of conflict.
* If multiple family gems are employed, they will each need to be installed and
required into the application. See below for details.
* Meta-data attributes include the frozen status and singleton methods. However
the tainted status is always copied.



## Installation

Add this line to your application's Gemfile:

    gem 'full_clone'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install full_clone

The safe_dup gem is at: ( https://rubygems.org/gems/safe_dup )
<br>The safe_clone gem is at: ( https://rubygems.org/gems/safe_clone )
<br>The full_dup gem is at: ( https://rubygems.org/gems/full_dup )
<br>The full_clone gem is at: ( https://rubygems.org/gems/full_clone )

## Usage

    require 'full_clone'

then, in those places where regular clone was problematic, use:

    foo = my_object.full_clone

instead of

    foo = my_object.clone

To exclude some instance variables from the deep cloning process, define a
full_clone_exclude method in the required class:

```ruby
def full_clone_exclude
  [:@bad_var1, :@bad_var2, :@bad_var_etc]
end
```
This also can be applied to arrays and hashes. In this case, it is possible to
define a singleton method on the cloned data. Then the exclude method would
return an array of array indexes or hash keys to be omitted from the full clone
recursion. Here is an example that never clones the first two elements of the
array:

```ruby
my_array.define_singleton_method(:full_clone_exclude) { [0, 1] }
```

## Notes

The full_clone gem tracks its progress and handles data objects that
contain loops, cycles, and other forms of recursion. In order to do this,
it relies heavily on the object_id property of the data being copied.
If object_id is broken, then full_clone and hashes and ... will also be
broken!


## Contributing

#### Plan A

1. Fork it ( https://github.com/PeterCamilleri/full_clone/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

#### Plan B

Go to the GitHub repository and raise an issue calling attention to some
aspect that could use some TLC or a suggestion or an idea.
