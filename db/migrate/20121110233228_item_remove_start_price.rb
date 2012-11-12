class ItemRemoveStartPrice < ActiveRecord::Migration
  def change
    remove_column(:items,:start_price)
  end
end
