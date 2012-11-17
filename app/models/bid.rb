class Bid < ActiveRecord::Base
  attr_accessible :amount, :item_id, :user_id, :created_at
  belongs_to :item
  belongs_to :user
end
