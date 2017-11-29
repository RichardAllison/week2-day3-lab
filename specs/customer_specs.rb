# Add an age to the Customer. Make sure the Pub checks the age before serving the Customer.
# Add alcohol_level to the Drink, and a drunkenness level to the Customer. Every time a Customer buys a drink, the drunkenness level should go up by the alcohol_level.
# Pub should refuse service above a certain level of drunkenness!



require('minitest/autorun')
require('minitest/rg')
require_relative('../pub.rb')
require_relative('../drinks.rb')
require_relative('../customer.rb')


class CustomerTest < MiniTest::Test

  def setup()
    @beer = Drink.new("Budweiser", 10)
    @vodka = Drink.new("Smirnoff", 30)
    @wine = Drink.new("Cabarnet", 20)
    @whisky = Drink.new("Jack Daniels", 60)
    @drinks = [@beer, @vodka, @wine, @whisky]
    @pub = Pub.new("Weatherspoons", 100, @drinks)
    @customer = Customer.new("Vishal", 50)
  end

  def  test_name
    assert_equal("Vishal", @customer.name)
  end

  def  test_wallet
    assert_equal(50, @customer.wallet)
  end

  def test_add_drink_to_customer_reduce_wallet
    @customer.customer_buy_drink(@pub, @wine)
    assert_equal(1, @customer.drinks_bought.length)
    assert_equal(30, @customer.wallet)
    assert_equal(120, @pub.till_value)
  end

  # def test_add_drink_to_customer
  #   @customer.add_drink_to_customer(@pub, @gin)
  #   assert_equal(0, @customer.drinks_bought.length)
  # end

  def test_customer_can_afford__true
    assert_equal(true, @customer.can_afford?(@pub, @vodka))
  end

  def test_customer_can_afford__false
    assert_equal(false, @customer.can_afford?(@pub, @whisky))
  end

  # def test_reduce_wallet_by_price
  #   @customer.reduce_wallet_by_price(@beer)
  #   assert_equal(40, @customer.wallet)
  # end

  # def test_buy_drink
  #
  #   assert_equal()
  # end


end
