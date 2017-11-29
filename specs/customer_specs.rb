# A Customer should have a name, and a wallet
# A Customer should be able to buy a Drink from the Pub, reducing the money in its wallet and increasing the money in the Pub's till


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

  # def test_add_drink_to_customer
  #   @customer.add_drink_to_customer(@pub, )
  #   assert_equal(1, @customer.drinks_bought.length)
  #   p @customer.drinks_bought
  # end

  # def test_add_drink_to_customer
  #   @customer.add_drink_to_customer(@gin)
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
