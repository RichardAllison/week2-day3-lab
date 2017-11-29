class Customer

  attr_reader :name, :wallet, :drinks_bought, :age, :drunkenness

  def initialize(name, wallet, age)
    @name = name
    @wallet = wallet
    @drinks_bought = []
    @age = age
    @drunkenness = 0
  end

  def can_afford_drink?(pub, drink)
    desired_drink = pub.identify_drink(drink)
    return @wallet > desired_drink.price
  end

  def can_afford_food?(pub, food)
    desired_food = pub.identify_food(food)
    return @wallet > desired_food.price
  end

  def customer_buy_drink(pub, drink, customer)
    if pub.drink_exists?(drink) && can_afford_drink?(pub, drink)
      @drinks_bought << pub.remove_drink(drink, customer)
      @wallet -= drink.price
      pub.add_drink_price_to_till(drink)
      @drunkenness += drink.alcohol_level
    end
  end

  def customer_buy_food(pub, food)
    if pub.food_exists?(food) && can_afford_food?(pub, food)
      @wallet -= food.price
      @drunkenness -= food.rejuvenation_level
      pub.add_food_price_to_till(food)
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
