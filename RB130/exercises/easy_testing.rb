require 'minitest/autorun'

class MyFirstTest < Minitest::Test
  def test_first_test
    assert value.odd?, 'value is not odd'

    assert_equal 'xyz', value.downcase

    ##########################################

    assert_nil value

    ##########################################

    assert_empty list
    # or
    assert_equal true, list.empty?

    ##########################################

    assert_includes list, 'xyz'
    # or
    assert_equal true, list.include?('xyz')

    ##########################################

  end

  def test_employe_hire
    assert_raises NoExperienceError do
      employee.hire
    end
  end

  def test_numeric
    assert_instance_of Numeric, value
  end

  def test_numeric_2
    # assert_equal true, value.is_a?(Numeric)
    assert_kind_of Numeric, value
  end

  def test_different_objects
    assert_same list, list.process
  end

  def test_xyz_in_list
    refute_includes list, 'xyz' 
  end
end