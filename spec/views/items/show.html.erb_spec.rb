require 'spec_helper'

describe "items/show" do
  category = FactoryGirl.create(:category, :name => "Electronics1")
  brand = FactoryGirl.create(:brand, :name => "Brand1")
  subcategory = FactoryGirl.create(:subcategory, :name => "Subcategory1")
  before(:each) do
    @item = assign(:item, stub_model(Item,
                                         :name => "Name",
                                         :description => "Description",
                                         :quantity => 1,
                                         :sale_type => "Instant Sale",
                                        :instant_price => 100
    ))
    @item.brand = brand
    @item.category = category
    @item.subcategory = subcategory
  end

  it "renders attributes" do
    render
    rendered.should match(/Name/)
    rendered.should match(/Description/)

  end
end

