# coding: utf-8

require_relative '../lib/full_clone'
require          'minitest/autorun'

#Test the monkey patches applied to the Object class.
class ArrayFullCloneTester < MiniTest::Unit::TestCase

  #Special initialize to track rake progress.
  def initialize(*all)
    $do_this_only_one_time = "" unless defined? $do_this_only_one_time

    if $do_this_only_one_time != __FILE__
      puts
      puts "Running test file: #{File.split(__FILE__)[1]}"
      $do_this_only_one_time = __FILE__
    end

    super(*all)
  end

  def test_basic_deep_cloning
    sa = "North"
    simple1 = [sa, 5, nil]
    simple2 = simple1.full_clone

    assert_equal(simple1[0], simple2[0])
    assert_equal(simple1[1], 5)
    assert_equal(simple1[2], nil)
    refute_equal(simple1[0].object_id, simple2[0].object_id)

    sa << "West"

    assert_equal(sa, "NorthWest")
    assert_equal(simple1[0], "NorthWest")
    assert_equal(simple2[0], "North")
  end

  def test_with_exclusion
    sa = "North"
    simple1 = [sa, 5, nil]
    simple1.define_singleton_method(:full_clone_exclude) {[0]}
    assert_equal(simple1.singleton_methods, [:full_clone_exclude])
    simple2 = simple1.full_clone
    assert_equal(simple2.singleton_methods, [:full_clone_exclude])

    assert_equal(simple1[0], simple2[0])
    assert_equal(simple1[1], 5)
    assert_equal(simple1[2], nil)
    assert_equal(simple1[0].object_id, simple2[0].object_id)
  end

  def test_with_direct_looping
    simple1 = ['East', 5, nil]
    simple1[2] = simple1
    simple2 = simple1.full_clone

    assert_equal(simple2.object_id, simple2[2].object_id)
    refute_equal(simple1.object_id, simple2[2].object_id)
  end

  def test_with_direct_looping_and_exclusion
    simple1 = ['East', 5, nil]
    simple1.define_singleton_method(:full_clone_exclude) {[2]}
    assert_equal(simple1.singleton_methods, [:full_clone_exclude])
    simple1[2] = simple1
    simple2 = simple1.full_clone
    assert_equal(simple2.singleton_methods, [:full_clone_exclude])

    refute_equal(simple2.object_id, simple2[2].object_id)
    assert_equal(simple1.object_id, simple2[2].object_id)
  end

  def test_with_indirect_looping
    simple1 = ['East', 5, nil]
    simple3 = ['West', 6, simple1]
    simple1[2] = simple3
    simple2 = simple1.full_clone

    assert_equal(simple2.object_id, simple2[2][2].object_id)
  end

end