class Customer

  attr_reader :name, :wallet, :drinks_bought

  def initialize(name, wallet)
    @name = name
    @wallet = wallet
    @drinks_bought = []
  end

  def can_afford?(pub, drink)
    desired_drink = pub.identify_drink(drink)
    return @wallet > desired_drink.price
  end

  def add_drink_to_customer(pub, drink)
    if can_afford(drink)
      @drinks_bought << drink
    end
    # @drinks_bought << pub.remove_drink(drink) if pub.drinks_stock.include?(drink)
  end

  def reduce_wallet_by_price(drink)
    @wallet -= drink.price
  end

  def buy_drink(pub, drink)
    pub.add_drink_price_to_till(drink)
  end

#   if can_afford?(drink)
#   pub.remove_drink(drink)
#   add drink to customer
#   (drink) reduce_wallet_by_price
#   (pub) till increase
# end

end
