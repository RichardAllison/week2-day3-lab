# A Pub should have a name, a till, and a collection of drinks

require('minitest/autorun')
require('minitest/rg')
require_relative('../pub.rb')
require_relative('../drinks.rb')


class PubTest < MiniTest::Test

  def setup()
    @beer = Drink.new("Budweiser", 10)
    @vodka = Drink.new("Smirnoff", 30)
    @wine = Drink.new("Cabarnet", 20)
    @drinks = [@beer, @vodka, @wine]
    @pub = Pub.new("Weatherspoons", 100, @drinks)
  end

  def  test_name
    assert_equal("Weatherspoons", @pub.name)
  end

  def  test_till_value
    assert_equal(100, @pub.till_value)
  end

  def  test_drinks_stock
    assert_equal(@drinks, @pub.drinks_stock)
  end

  # def test_multiple_drinks_ordered_single_transaction
  #   @pub.remove_multiple_drinks_single_transaction([@beer, @wine])
  #   assert_equal(1, @pub.drinks_stock.length)
  # end

  def test_remove_drink
    result = @pub.remove_drink(@beer)
    assert_equal(2, @pub.drinks_stock.length)
    assert_equal([@vodka, @wine], @pub.drinks_stock)
  end

  def  test_remove_multiple_drinks
    @pub.remove_drink(@beer)
    @pub.remove_drink(@wine)
    assert_equal(1, @pub.drinks_stock.length)
  end

  def test_remove_drink_not_found
    result = @pub.remove_drink(@gin)
    assert_equal(3, @pub.drinks_stock.length)
  end

  def test_add_drink_price_to_till
    @pub.add_drink_price_to_till(@beer)
    @pub.add_drink_price_to_till(@wine)
    assert_equal(130, @pub.till_value)
  end

  def test_add_drink_price_to_till_not_found
    @pub.add_drink_price_to_till(@gin)
    assert_equal(100, @pub.till_value)
  end




end
