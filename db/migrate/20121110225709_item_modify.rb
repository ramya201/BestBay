class ItemModify < ActiveRecord::Migration
  def change
    rename_column(:items,:instant_price,:price)
  end

end
