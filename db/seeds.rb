# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

brands = Brand.create([{ name: 'Canon' }, { name: 'Kodak' }, { name: 'Sony'}, {name:'HP'},{name:'Samsung'},{name:'Other'}])

categories = Category.create([{ name: 'Electronics' }, { name: 'Books' }, { name: 'Appliances' }, { name: 'Furniture' }, { name: 'Apparel & Accessories'}, { name: 'Health & Beauty' }])

subcategories = Subcategory.create([{ category_id: '1', name: 'Laptops' }, { category_id: '1', name: 'Cameras' }, { category_id: '1', name: 'Mobiles' }, { category_id: '1', name: 'Headphones' }, { category_id: '2', name: 'Fiction' }, { category_id: '2', name: 'Non-Fiction' },{ category_id: '2', name: 'Magazines' },{ category_id: '2', name: 'Textbooks' },{ category_id: '3', name: 'Microwaves' },{ category_id: '3', name: 'Irons' },{ category_id: '3', name: 'Toasters' }, { category_id: '4', name: 'Tables' }, { category_id: '4', name: 'Chairs' },{ category_id: '4', name: 'Bedframes' }, { category_id: '4', name: 'Mattresses' },{ category_id: '5', name: 'Clothing'}, { category_id: '5', name: 'Shoes' },{ category_id: '5', name: 'Handbags' },{ category_id: '5', name: 'Luggage' },{ category_id: '5', name: 'Jewellery'}])

items = Item.create([{name: 'IS1', description: 'this is IS1', start_price: '', instant_price: '100', quantity: '10', sale_type: 'IS', start_time: '', end_time: '', user_id: '1', brand_id: '1', category_id: '1', subcategory_id: '1'}, {name: 'IS2', description: 'this is IS2', start_price: '', instant_price: '100', quantity: '0', sale_type: 'IS', start_time: '', end_time: '', user_id: '1', brand_id: '1', category_id: '1', subcategory_id: '2'}, {name: 'A1', description: 'this is A1', start_price: '10', instant_price: '', quantity: '1', sale_type: 'A', start_time: '2012-11-01 00:00:00.0', end_time: '201-12-31 00:00:00.0', user_id: '1', brand_id: '1', category_id: '1', subcategory_id: '1'}, {name: 'A2', description: 'this is A2', start_price: '100', instant_price: '', quantity: '1', sale_type: 'A', start_time: '2012-11-01 00:00:00.0', end_time: '201-11-04 00:00:00.0', user_id: '1', brand_id: '1', category_id: '1', subcategory_id: '2'}])

# users = User.create([{username: '', password: '', first_name: '123', last_name: '123', image: '', created_at: '2012-11-09 21:14:43.120438', updated_at: '2012-11-09 21:14:43.126210', email: '123@123.com', encrypted_password: '$2a$10$k4r00z7c4uYrrhO5LZun.OjzWXQsgNPNhVcw8A/ohHWY3bjjr0.XG', reset_password_token:'', reset_password_sent_at:'', remember_created_at: '', sign_in_count: '1', current_sign_in_at: '2012-11-09 21:14:43.125524', last_sign_in_at: '2012-11-09 21:14:43.125524', current_sign_in_ip: '127.0.0.1', last_sign_in_ip: '127.0.0.1'}])