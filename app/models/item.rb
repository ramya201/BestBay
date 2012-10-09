class Item < ActiveRecord::Base
  attr_accessible :brand_id, :category_id, :description, :end_time, :image, :instant_price, :name, :quantity, :sale_type, :start_price, :start_time, :subcategory_id, :user_id
  belongs_to :category
  belongs_to :subcategory
  belongs_to :brand
  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end

end
