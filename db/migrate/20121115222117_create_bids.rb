class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.integer :item_id
      t.integer :user_id
      t.integer :amount

      t.timestamps
    end
  end
end
