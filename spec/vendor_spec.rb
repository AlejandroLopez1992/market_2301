require './lib/item'
require './lib/vendor'

RSpec.describe Vendor do
  
  before(:each) do
    @vendor = Vendor.new("Rocky Mountain Fresh")
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
  end

  describe 'initialize' do
    it 'exists and has attributes' do
      expect(@vendor).to be_a(Vendor)
      expect(@vendor.name).to eq("Rocky Mountain Fresh")
      expect(@vendor.inventory).to eq({})
    end
  end

  describe 'vendor has check stock & stock methods' do
    it 'check_stock can check amount of particular item' do
      expect(@vendor.check_stock(@item1)).to eq(0)
      @vendor.stock(@item1, 30)
      expect(@vendor.inventory).to eq({@item1 => 30})
      expect(@vendor.check_stock(@item1)).to eq(30)
    end

    it 'multiple items can be stocked in inventory and quantity is added' do
      @vendor.stock(@item1, 30)
      expect(@vendor.check_stock(@item1)).to eq(30)
      @vendor.stock(@item1, 25)
      expect(@vendor.check_stock(@item1)).to eq(55)
      @vendor.stock(@item2, 12)
      expect(@vendor.inventory).to eq({
        @item1 => 55
        @item2 => 12
      })
    end
  end
end
