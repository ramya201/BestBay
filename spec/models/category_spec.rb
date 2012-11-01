require "rspec"
require "spec_helper"
require_relative "../../app/models/category"


describe Category do

  before { @category = Category.new(name: "Example Category")}

  subject { @category }

  it { should respond_to(:name) }


  it "is not valid without a name" do
    @category.name = nil
    @category.should_not be_valid
  end


  it "should have many subcategories" do
    category = Category.reflect_on_association(:subcategories)
    category.macro.should == :has_many
  end

end