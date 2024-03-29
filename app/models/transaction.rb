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

class Transaction < ActiveRecord::Base
  attr_accessible :cost, :item_id, :quantity, :user_id
  belongs_to :item
  belongs_to :user
  validates_presence_of :item_id, :user_id
end
