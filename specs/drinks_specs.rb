# A Pub should have a name, a till, and a collection of drinks
# A Drink should have a name, and a price
# A Customer should have a name, and a wallet
# A Customer should be able to buy a Drink from the Pub, reducing the money in its wallet and increasing the money in the Pub's till

require('minitest/autorun')
require('minitest/rg')
require_relative('../drinks.rb')


class DrinkTest < MiniTest::Test

  def setup()
    @drinks = Drink.new("Budweiser", 10)
end

def  test_name
  assert_equal("Budweiser", @drinks.name)
end

def  test_price
  assert_equal(10, @drinks.price)
end


end
