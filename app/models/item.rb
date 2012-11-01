class Item < ActiveRecord::Base
  attr_accessible :brand_id, :category_id, :description, :end_time, :image, :instant_price, :name, :quantity, :sale_type, :start_price, :start_time, :subcategory_id, :user_id, :pic
  belongs_to :category
  belongs_to :subcategory
  belongs_to :brand

  has_attached_file :pic, :styles => { :medium => "300x300"},
                    :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
                    :url => "/system/:attachment/:id/:style/:filename"
  validates_presence_of :name,:category_id,:subcategory_id,:brand_id

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end

end
