class Transaction < ActiveRecord::Base
  attr_accessible :cost, :item_id, :quantity, :user_id
end
