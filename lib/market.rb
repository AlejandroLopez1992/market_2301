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
    items = Hash.new {|item, details| item[details] = {} }
    item_details = Hash.new(0)
    @vendors.each do |vendor|
      vendor.inventory.each do |item, quantity|
        items[item] = item_details
          item_details[:quantity] += vendor.check_stock(item) if item == vendor.inventory.first
          require 'pry'; binding.pry
          item_details[:vendors] = vendors_that_sell(item) if vendor.inventory.include?(item) 
      end
    
    end
    items
  end
end
