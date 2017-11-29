class Pub

  attr_reader :name, :till_value, :drinks_stock, :food_stock

  def initialize(name, till_value, drinks_stock, food_stock)
    @name = name
    @till_value = till_value
    @drinks_stock = drinks_stock || []
    @food_stock = food_stock || []
  end

  def drink_exists?(drink_object)
    @drinks_stock.include?(drink_object)
  end

  def identify_drink(drink_object)
    if drink_exists?(drink_object)
      for drink in @drinks_stock
        return drink if drink == drink_object
      end
    end
    return "Drink Not Found"
  end

  def food_exists?(food_object)
    @food_stock.include?(food_object)
  end

  def identify_food(food_object)
    if food_exists?(food_object)
      for food in @food_stock
        return food if food == food_object
      end
    end
    return "Food Not Found"
  end

def check_age?(customer)
  customer.age > 18
end

def remove_drink(drink_object, customer)
  if drink_exists?(drink_object) && check_age?(customer) && (customer.drunkenness < 20)
    drink_sold = identify_drink(drink_object)
    @drinks_stock.delete(drink_sold)
  end
end


  #   if drink_exists?(drink_object)
  #     for drink in @drinks_stock
  #       @drinks_stock.delete(drink) if drink == drink_object
  #     end
  #   end
  #   return "Drink Not Found"
  # end

  # def remove_multiple_drinks_single_transaction(drinks_array)
  #   for drink in drinks_array
  #     remove_drink(drink)
  #   end
  # end




  def add_drink_price_to_till(drink)
    @till_value += drink.price
    # if @drinks_stock.include?(drink)
  end

  def add_food_price_to_till(food)
    @till_value += food.price
  end

end
