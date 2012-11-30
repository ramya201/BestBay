class CartController < ApplicationController
	include CartHelper

	def add
		add_to_cart(params[:item_obj], params[:qty])
        flash[:notice] = "Succesfully added to your cart!"
		redirect_to :controller => "items", :action => "show"
	end

	def get
		redirect_to :controller => "items", :action => "show"
	end

	def remove
		remove_from_cart(Item.find(params[:id]))
		redirect_to :controller => "cart", :action => "index"
	end

	def index
	end
	
	def checkout
	end

	def pay
		items=get_all_items_in_cart
		to_be_removed=Array.new
		items.each do |cart_item|
			item=Item.find(cart_item.fetch("table").fetch("cart_item_id"))
			if item.quantity<cart_item.fetch("table").fetch("count")
				flash[:notice] = "inventory not enough for item: #{item.name}"
				redirect_to :controller => "cart", :action => "index"
			end
			item.quantity-=cart_item.fetch("table").fetch("count")
			item.save
			trans=Transaction.new({user_id: User.current_user.id, item_id: item.id, quantity: cart_item.fetch("table").fetch("count"), cost: item.price})
			trans.save
			to_be_removed.append(item)
		end
		to_be_removed.each do |rm_item|
			remove_from_cart(rm_item)
		end

		flash[:notice] = "Congratulations! Payment successful!"
		redirect_to :controller => "categories", :action => "index"
	end
end
