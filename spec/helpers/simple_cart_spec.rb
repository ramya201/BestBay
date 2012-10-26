require "rspec"
require "spec_helper"
#require_relative "../../app/helpers/simple_cart"


describe Cart do
  before(:each) do
    @cart = Cart.new
    10.times { @cart.items.push(FactoryGirl.build(:cartitem)) }
    @item=FactoryGirl.build(:item)
    @item.id=123123
    @cart.add(@item)
  end

  describe "load cart items" do
    it "should load serialized items" do
      loaded_cart = Cart.load(@cart.save)
      loaded_cart.items.should eql(@cart.items)
    end

    it "should return empty cart if first (and only) argument is nil" do
      Cart.load(nil).items.should eql(Array.new)
    end
  end

  describe "#items" do
    it "should create new cart with empty items" do
      Cart.new.items.should be_empty
    end

    it "should be array of products" do
      @cart.items.all? { |item| item.kind_of?(CartItem) }.should be_true
    end
  end

  describe "#save" do
    it "should serialize items" do
      @cart.save.should be_kind_of(String)
    end

    it "should be regular JSON string" do
      JSON.parse(@cart.save).should_not raise_error
    end
  end

  describe "#add" do
    it "should add one product into cart by default" do
      expect {@cart.add(@item)}.to change {@cart.find(@item).count}.by(1)
    end
    it "should add more product into cart's items when optional argument given" do
      expect {@cart.add(@item,10)}.to change {cart.find(@item).count}.by(10)
    end
  end

  describe "#remove" do
    it "should remove some number of item from cart when optional argument given" do
      expect {@cart.remove(@item,5)}.to change {cart.find(@item).count}.by(-5)
    end
    it "should remove the item from the cart by default" do
      expect {@cart.remove(@item)}.to change {cart.find(@item)}.to(nil)
    end
  end

  describe "#empty?" do
    it "should returns true if there aren't any items" do
      Cart.new.empty?.should_be true
    end

    it "should returns false if there aren't any items" do
      @cart.should_not be_empty
    end
  end

  describe "cart initialization" do
    it "should initialize the cart with no items in it" do
      Cart.new.items.should be_empty
    end
  end
end