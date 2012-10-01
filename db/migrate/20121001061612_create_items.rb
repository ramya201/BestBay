class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.string :image
      t.integer :start_price
      t.integer :instant_price
      t.integer :quantity
      t.string :sale_type
      t.timestamp :start_time
      t.timestamp :end_time
      t.integer :user_id
      t.integer :brand_id
      t.integer :category_id
      t.integer :subcategory_id

      t.timestamps
    end
  end
end
