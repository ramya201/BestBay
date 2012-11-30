module ApplicationHelper
  def get_highest_bid(item_id)
    @bid = Bid.find_all_by_item_id(item_id).sort_by{|e| -e[:amount]}.first()
    if @bid == nil
      Item.find(item_id).price
    else
      @bid.amount
    end
  end
  def get_start_price(item_id)
      Item.find(item_id).price
  end
  def get_transactions(item_id)
    @transactions = Transaction.where(:item_id => item_id)
  end
end
