# coding: utf-8

require_relative '../lib/full_clone'
require          'minitest/autorun'

#Test the monkey patches applied to the Object class.
class FullCloneTester < MiniTest::Unit::TestCase

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
    assert_equal((6).full_clone, 6)
    assert_equal((6).full_clone.object_id, (6).object_id)

    assert_equal((:foo).full_clone, :foo)
    assert_equal((:foo).full_clone.object_id, (:foo).object_id)

    assert_equal((true).full_clone, true)
    assert_equal((true).full_clone.object_id, (true).object_id)

    assert_equal((false).full_clone, false)
    assert_equal((false).full_clone.object_id, (false).object_id)

    assert_equal((nil).full_clone, nil)
    assert_equal((nil).full_clone.object_id, (nil).object_id)

    rex = /ABC/
    assert_equal(rex.full_clone, rex)
    assert_equal(rex.full_clone.object_id, rex.object_id)
  end

end
