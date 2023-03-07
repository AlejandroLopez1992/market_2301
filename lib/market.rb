class Market
  
  attr_reader :name, :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map { |vendor| vendor.name }
  end

  def vendors_that_sell(item)
    @vendors.select { |vendor| vendor.inventory.include?(item)}
  end

  def sorted_item_list
    @vendors.map do |vendor|
      vendor.inventory.map do |item, quantity|
        item.name
      end
    end.flatten.uniq.sort { |a, b| a <=> b }
  end

  def total_inventory
    items = Hash.new {|item, details|}
    @vendors.each do |vendor|
      vendor.inventory.each do |item, quantity|
        if items[item]
          items[item][:quantity] += quantity
          items[item][:vendors] << vendor 
        else
          new_item = Hash.new 
          new_item[:quantity] = 0
          new_item[:vendors] = []
          items[item] = new_item
          new_item[:quantity] += quantity
          new_item[:vendors] << vendor
        end
      end
    end
    items
  end
end
