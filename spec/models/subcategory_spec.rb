# == Schema Information
#
# Table name: subcategories
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require "rspec"
require "spec_helper"
require_relative "../../app/models/subcategory"


describe Subcategory do

  before { @subcategory = Subcategory.new(name: "Example Subcategory",category_id: "2")}

  subject { @subcategory }

  it { should respond_to(:name) }
  it { should respond_to(:category_id) }


  it "is not valid without a name" do
    @subcategory.name = nil
    @subcategory.should_not be_valid
  end

  it "is not valid without a category_id" do
    @subcategory.category_id = nil
    @subcategory.should_not be_valid
  end


  it "should have many items" do
    subcategory = Subcategory.reflect_on_association(:items)
    subcategory.macro.should == :has_many
  end

end
