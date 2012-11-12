class ItemModify < ActiveRecord::Migration
  def change
    rename_column(:items,:instant_price,:price)
    remove_column(:items,:start_price)
  end

end
