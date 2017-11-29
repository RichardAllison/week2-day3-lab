# Add an age to the Customer. Make sure the Pub checks the age before serving the Customer.
# Add alcohol_level to the Drink, and a drunkenness level to the Customer. Every time a Customer buys a drink, the drunkenness level should go up by the alcohol_level.
# Pub should refuse service above a certain level of drunkenness!



require('minitest/autorun')
require('minitest/rg')
require_relative('../pub.rb')
require_relative('../drinks.rb')
require_relative('../customer.rb')
require_relative('../food.rb')


class CustomerTest < MiniTest::Test

  def setup()
    @beer = Drink.new("Budweiser", 10, 5)
    @vodka = Drink.new("Smirnoff", 30, 40)
    @wine = Drink.new("Cabarnet", 20, 15)
    @whisky = Drink.new("Jack Daniels", 60, 45)
    @drinks = [@beer, @vodka, @wine, @whisky]
    @pasta = Food.new("spaghetti", 5, 10)
    @food = [@pasta]
    @pub = Pub.new("Weatherspoons", 100, @drinks, @food)
    @customer = Customer.new("Vishal", 50, 29)

  end

  def  test_name
    assert_equal("Vishal", @customer.name)
  end

  def  test_wallet
    assert_equal(50, @customer.wallet)
  end

  def test_customer_buy_drink
    @customer.customer_buy_drink(@pub, @wine, @customer)
    assert_equal(1, @customer.drinks_bought.length)
    assert_equal(30, @customer.wallet)
    assert_equal(120, @pub.till_value)
  end

  def test_customer_buy_drink
    @customer.customer_buy_drink(@pub, @beer, @customer)
    assert_equal(1, @customer.drinks_bought.length)
  end


def test_drunkenness_level_increases
  @customer.customer_buy_drink(@pub, @beer, @customer)
  assert_equal(5, @customer.drunkenness)
end

  # def test_add_drink_to_customer
  #   @customer.add_drink_to_customer(@pub, @gin)
  #   assert_equal(0, @customer.drinks_bought.length)
  # end

  def test_customer_can_afford__true
    assert_equal(true, @customer.can_afford_drink?(@pub, @vodka))
  end

  def test_customer_can_afford__false
    assert_equal(false, @customer.can_afford_drink?(@pub, @whisky))
  end


  # def test_reduce_wallet_by_price
  #   @customer.reduce_wallet_by_price(@beer)
  #   assert_equal(40, @customer.wallet)
  # end

  def test_buy_food
    @customer.customer_buy_drink(@pub, @wine, @customer)
    @customer.customer_buy_food(@pub, @pasta)
    assert_equal(5, @customer.drunkenness)
  end

end
