# == Schema Information
#
# Table name: items
#
#  id               :integer          not null, primary key
#  name             :string(255)
#  description      :string(255)
#  price            :integer
#  quantity         :integer
#  sale_type        :string(255)
#  start_time       :datetime
#  end_time         :datetime
#  user_id          :integer
#  brand_id         :integer
#  category_id      :integer
#  subcategory_id   :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  pic_file_name    :string(255)
#  pic_content_type :string(255)
#  pic_file_size    :integer
#

class Item < ActiveRecord::Base
  attr_accessible :brand_id, :category_id, :description, :end_time, :image, :price, :name, :quantity, :sale_type, :start_time, :subcategory_id, :user_id, :pic
  belongs_to :category
  belongs_to :subcategory
  belongs_to :brand
  belongs_to :user

  has_attached_file :pic, :styles => { :medium => "200x200"},
                    :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
                    :url => "/system/:attachment/:id/:style/:filename"

  validates_presence_of :name,:category_id,:subcategory_id,:brand_id

  def self.search(search)                                #search an item
    if search
      where('name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end

end
