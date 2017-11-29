require('minitest/autorun')
require('minitest/rg')
require_relative('../food.rb')


class FoodTest < MiniTest::Test

  def setup()
    @pasta = Food.new("spaghetti", 5, 10)
  end

  def  test_name
    assert_equal("spaghetti", @pasta.name)
  end

  def  test_price
    assert_equal(5, @pasta.price)
  end

  def  test_rejuvination_level
    assert_equal(10, @pasta.rejuvenation_level)
  end


end
