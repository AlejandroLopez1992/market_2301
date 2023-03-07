class Vendor
  
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    @inventory[item]
  end

  def stock(item, quantity)
    @inventory[item] += quantity
  end

  def potential_revenue
    possible_revenue = 0
    @inventory.each { |item, quantity| possible_revenue += (item.price * quantity) }
    possible_revenue
  end
end
