# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


categories = Category.create([{ name: 'Electronics' }, { name: 'Books' }, { name: 'Appliances' }, { name: 'Furniture' }])

subcategories = Subcategory.create([{ category_id: '1', name: 'Laptops' }, { category_id: '1', name: 'Cameras' }, { category_id: '1', name: 'Mobiles' }, { category_id: '1', name: 'Headphones' }, { category_id: '2', name: 'Fiction' }, { category_id: '2', name: 'Non-Fiction' }, { category_id: '3', name: 'Tables' }, { category_id: '3', name: 'Chairs' }])
