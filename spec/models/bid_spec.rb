require 'spec_helper'

describe Bid do
  before { @bid = Bid.new(item_id: "1",user_id: "1",amount: "10")}

  subject { @bid }

  it { should respond_to(:item_id) }
  it { should respond_to(:user_id) }
  it { should respond_to(:amount) }

  it "belongs to a user" do
    bid = Bid.reflect_on_association(:user)
    bid.macro.should == :belongs_to
  end

  it "belongs to an item" do
    bid = Bid.reflect_on_association(:item)
    bid.macro.should == :belongs_to
  end

end
