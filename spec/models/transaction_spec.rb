# == Schema Information
#
# Table name: transactions
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  item_id    :integer
#  quantity   :integer
#  cost       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Transaction do
  before { @transaction = Transaction.new(item_id: "1",user_id: "1",cost: "10",quantity: 1)}

  subject { @transaction }

  it { should respond_to(:item_id) }
  it { should respond_to(:user_id) }
  it { should respond_to(:cost) }
  it { should respond_to(:quantity) }

  it "is not valid without an item id" do
    @transaction.item_id = nil
    @transaction.should_not be_valid
  end

  it "is not valid without a user id" do
    @transaction.user_id = nil
    @transaction.should_not be_valid
  end

  it "belongs to a user" do
    transaction = Transaction.reflect_on_association(:user)
    transaction.macro.should == :belongs_to
  end

  it "belongs to an item" do
    transaction = Transaction.reflect_on_association(:item)
    transaction.macro.should == :belongs_to
  end

end

