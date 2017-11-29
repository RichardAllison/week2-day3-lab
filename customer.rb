class Customer

attr_reader :name, :wallet, :drinks_bought

  def initialize(name, wallet)
    @name = name
    @wallet = wallet
    @drinks_bought = []
  end

def add_drink_to_customer(drink)
  @drinks_bought.push(drink)
end



end
