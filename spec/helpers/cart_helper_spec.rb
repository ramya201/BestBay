require 'spec_helper'
require_relative '../../app/helpers/cart_helper'

# Specs in this file have access to a helper object that includes
# the CartHelper. For example:
#
# describe CartHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe CartHelper do
  include CartHelper

  it "should return total item count in the cart" do
    @cart = Cart.new
    item = FactoryGirl.create(:item)
    json_string = "[{\"table\":{\"cart_item_id\":" + item.id.to_s + " ,\"count\":2},\"modifiable\":true}]"
    @cart.items = JSON.parse(json_string)
    expect { add_to_cart(item.id, 2) }.to change { get_total_item_count }.by(2)
=begin
    count_before = get_total_item_count
    add_to_cart(1, 2)
    count_after = get_total_item_count
    (count_after-count_before).should eql(2)
=end
  end

end
