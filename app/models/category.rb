class Category < ActiveRecord::Base
  attr_accessible :name
  has_many :subcategories
  validates_presence_of :name
end
