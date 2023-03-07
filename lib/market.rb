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
end
