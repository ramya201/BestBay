# == Schema Information
#
# Table name: brands
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require "rspec"
require "spec_helper"
require_relative "../../app/models/brand"


describe Brand do

  before { @brand = Brand.new(name: "Example Brand")}

  subject { @brand }

  it { should respond_to(:name) }

  it "is not valid without a title" do
    @brand.name = nil
    @brand.should_not be_valid
  end

  it "should have many items" do
    brand = Brand.reflect_on_association(:items)
    brand.macro.should == :has_many
  end

end
