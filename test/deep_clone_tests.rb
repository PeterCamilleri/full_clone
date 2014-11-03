# coding: utf-8

require_relative '../lib/deep_clone'
require          'minitest/autorun'

#Test the monkey patches applied to the Object class.
class DeepCloneTester < MiniTest::Unit::TestCase

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

  def test_for_safe_value_cloning
    assert_equal((6).deep_clone, 6)
    assert_equal((6).deep_clone.object_id, (6).object_id)

    assert_equal((:foo).deep_clone, :foo)
    assert_equal((:foo).deep_clone.object_id, (:foo).object_id)

    assert_equal((true).deep_clone, true)
    assert_equal((true).deep_clone.object_id, (true).object_id)

    assert_equal((false).deep_clone, false)
    assert_equal((false).deep_clone.object_id, (false).object_id)

    assert_equal((nil).deep_clone, nil)
    assert_equal((nil).deep_clone.object_id, (nil).object_id)

    rex = /ABC/
    assert_equal(rex.deep_clone, rex)
    assert_equal(rex.deep_clone.object_id, rex.object_id)
  end

end
