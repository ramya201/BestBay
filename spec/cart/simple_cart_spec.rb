require "rspec"
require "spec_helper"
require "cart/simple_cart"


describe Cart do
  before(:each) do
    @cart = Cart.new
    @item=FactoryGirl.build(:item)
    @item.id=123123
    @cart.add(@item)
  end

  describe "load cart items" do
    it "should load serialized items" do
      loaded_cart = Cart.load(@cart.save)
      loaded_cart.items.to_json.should eql(@cart.items.to_json)
    end

    it "should return empty cart if first (and only) argument is nil" do
      Cart.load(nil).items.should eql(Array.new)
    end
  end

  describe "#items" do
    it "should create new cart with empty items" do
      Cart.new.items.should be_empty
    end

    it "should be array of CartItems" do
      @cart.items.all? { |item| item.kind_of?(CartItem) }.should be_true
    end
  end

  describe "#save" do
    it "should serialize items" do
      @cart.save.should be_kind_of(String)
    end

  end

  describe "#add" do
    it "should add one item into cart by default" do
      @cart.items = Cart.load(@cart.save).items
      expect { @cart.add(@item)
      @cart.save
      }.to change {@cart.find_item(@item)["count"]}.by(1)
    end
    it "should add more items into cart's items when optional argument given" do
      @cart.items = Cart.load(@cart.save).items
      expect { @cart.add(@item,10)
      @cart.save
      }.to change {@cart.find_item(@item)["count"]}.by(10)
    end
  end

  describe "#remove" do
    it "should remove some number of item from cart when optional argument given" do
      @cart.items = Cart.load(@cart.save).items
      @cart.add(@item)
      @cart.save
      @cart.add(@item)
      @cart.save
      @cart.add(@item)
      @cart.save
      @cart.add(@item)
      @cart.save
      expect {@cart.remove(@item,2)}.to change {@cart.find_item(@item)["count"]}.by(-2)
    end

    it "should remove the item from the cart by default" do
      @cart.items = Cart.load(@cart.save).items
      @cart.add(@item)
      @cart.save
      expect {@cart.remove(@item)}.to change {@cart.find_item(@item)}.to(nil)
    end
  end

  describe "#empty?" do
    it "should return true if there aren't any items" do
      Cart.new.empty?.should be_true
    end

    it "should return false if there aren't any items" do
      @cart.should_not be_empty
    end
  end

  describe "cart initialization" do
    it "should initialize the cart with no items in it" do
      Cart.new.items.should be_empty
    end
  end
end