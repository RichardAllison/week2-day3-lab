class Pub

  attr_reader :name, :till_value, :drinks_stock

  def initialize(name, till_value, drinks_stock)
    @name = name
    @till_value = till_value
    @drinks_stock = drinks_stock || []
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

  def remove_drink(drink_object)
    if @drinks_stock.include?(drink_object)
      for drink in @drinks_stock
        @drinks_stock.delete(drink) if drink == drink_object
      end
    end
    return "Drink Not Found"
  end

  # def remove_multiple_drinks_single_transaction(drinks_array)
  #   for drink in drinks_array
  #     remove_drink(drink)
  #   end
  # end




  def add_drink_price_to_till(drink)
    @till_value += drink.price if @drinks_stock.include?(drink)
  end

end
