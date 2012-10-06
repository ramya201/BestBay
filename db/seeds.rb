# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

brands = Brand.create([{ name: 'Canon' }, { name: 'Kodak' }])

categories = Category.create([{ name: 'Electronics' }, { name: 'Books' }, { name: 'Appliances' }, { name: 'Furniture' }, { name: 'Clothing & Accessories'}, { name: 'Health & Beauty' }])

subcategories = Subcategory.create([{ category_id: '1', name: 'Laptops' }, { category_id: '1', name: 'Cameras' }, { category_id: '1', name: 'Mobiles' }, { category_id: '1', name: 'Headphones' }, { category_id: '2', name: 'Fiction' }, { category_id: '2', name: 'Non-Fiction' },{ category_id: '2', name: 'Magazines' },{ category_id: '2', name: 'Textbooks' },{ category_id: '3', name: 'Microwaves' },{ category_id: '3', name: 'Irons' },{ category_id: '3', name: 'Toasters' }, { category_id: '4', name: 'Tables' }, { category_id: '4', name: 'Chairs' }])

items = Item.create([{ brand_id: '1', category_id: '1', subcategory_id: '1', name: 'Canon EOS Rebel T3i / 600D 18.0 MP Digital SLR Camera - Black (Kit w/ EF-S IS II 18-55mm Lens)', description: 'Capture all your special moments with the Canon EOS Rebel T3i/600D DSLR camera and cherish the memories over and over again.', image: '/Images/item.JPG', }, { brand_id: '2', category_id: '1', subcategory_id: '1', name: 'Kodak EASYSHARE C183 14.0 MP Digital Camera - Black', description: 'Share your world big and bright with the Kodak EASYSHARE C183 Digital Camera. Now sharing your life in amazing detail is as simple as pressing a button.', image: '/Images/item.JPG', }])