# DeepClone

The standard clone method creates a fresh instance of most (non-scalar) objects
but does not clone internal state. This internal state remains aliased in the
cloned copy. The full_clone method digs deep and makes copies of these internal
variables, not just arrays and hashes. It also allows classes to specify an
exclusion list of variable that are not to be processed.

Add this line to your application's Gemfile:

    gem 'full_clone'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install full_clone

## Usage

    require 'full_clone'

then, in those places where regular clone was problematic, use:

    foo = my_object.full_clone

instead of

    foo = my_object.clone

To exclude some instance variables from the deep cloning process, define a
full_clone_exclude method in the required class:

    def full_clone_exclude
      [:@bad_var1, :@bad_var2, :@bad_var_etc]
    end


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
