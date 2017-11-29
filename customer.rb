class Customer

  attr_reader :name, :wallet, :drinks_bought, :age, :drunkenness

  def initialize(name, wallet, age)
    @name = name
    @wallet = wallet
    @drinks_bought = []
    @age = age
    @drunkenness = 0
  end

  def can_afford?(pub, drink)
    desired_drink = pub.identify_drink(drink)
    return @wallet > desired_drink.price
  end

  def customer_buy_drink(pub, drink, customer)
    if pub.drink_exists?(drink) && can_afford?(pub, drink)
        @drinks_bought << pub.remove_drink(drink, customer)
        @wallet -= drink.price
        pub.add_drink_price_to_till(drink)
        @drunkenness += drink.alcohol_level
    end
  end
  # def reduce_wallet_by_price(pub, drink)
  #   @wallet -= drink.price
  # end

  # def buy_drink(pub, drink)
  #
  #   pub.add_drink_price_to_till(drink)
  # end

#   if can_afford?(drink)
#   pub.remove_drink(drink)
#   add drink to customer
#   (drink) reduce_wallet_by_price
#   (pub) till increase
# end

end
