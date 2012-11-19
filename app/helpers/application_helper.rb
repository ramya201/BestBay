module ApplicationHelper
  def get_highest_bid(item_id)
    @bid = Bid.find_all_by_item_id(item_id).sort_by{|e| -e[:amount]}.first()
    if @bid == nil
      Item.find(item_id).price
    else
      @bid.amount
    end
  end
end
