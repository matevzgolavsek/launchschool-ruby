require 'minitest/autorun'
# require "minitest/reporters"
# Minitest::Reporters.use!

require_relative 'quiz_testing'

class CatTest < MiniTest::Test
  def setup
    @kitty = Cat.new('Kitty', 5)
  end

  def test_is_cat; end

  def test_name
    assert_equal(@kitty.name, 'Milo')
  end

  def test_skip 
    skip 'skip test'
  end

  # def test_miaow
  #   puts "test miaow"
  #   puts "#{@kitty.miaow}"

  #   assert(@kitty.miaow.include?(' is miaowing.'))

  # end

  # def test_raises_error
  #   assert_raises do
  #     Cat.new
  #   end

  #   # assert(Cat.new == ArgumentError)
  #   assert_raises(ArgumentError) do
  #     Cat.new
  #   end
  # end

  def test_is_not_purrier
    patch = Cat.new('Patch', 5)
    milo = Cat.new('Milo', 3)

    refute(patch.purr_factor > milo.purr_factor)
  end
end