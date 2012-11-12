require "rspec"
require "spec_helper"
require_relative "../../app/models/item"


describe Item do

  before { @item = Item.new(name: "Example Item",category_id: "2",subcategory_id: "3",brand_id: "2",description: "XYZ",sale_type: "Auction",quantity: "4",price: "100")}

  subject { @item }

  it { should respond_to(:name) }
  it { should respond_to(:category_id) }
  it { should respond_to(:subcategory_id) }
  it { should respond_to(:brand_id) }
  it { should respond_to(:description) }
  it { should respond_to(:sale_type) }
  it { should respond_to(:quantity) }
  it { should respond_to(:price) }

  it "is not valid without a name" do
    @item.name = nil
    @item.should_not be_valid
  end

  it "is not valid without a category_id" do
    @item.category_id = nil
    @item.should_not be_valid
  end

  it "is not valid without a subcategory_id" do
    @item.subcategory_id = nil
    @item.should_not be_valid
  end

  it "is not valid without a brand_id" do
    @item.brand_id = nil
    @item.should_not be_valid
  end


  it "belongs to subcategory" do
    item = Item.reflect_on_association(:subcategory)
    item.macro.should == :belongs_to
  end

  it "belongs to category" do
    item = Item.reflect_on_association(:category)
    item.macro.should == :belongs_to
  end

  it "belongs to brand" do
    item = Item.reflect_on_association(:brand)
    item.macro.should == :belongs_to
  end

end