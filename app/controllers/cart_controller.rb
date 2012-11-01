class CartController < ApplicationController
	include CartHelper

	def add                                                            #adds items to cart
		add_to_cart(params[:item_obj], params[:qty])
		redirect_to :controller => "items", :action => "show"
	end

	def get                                                            #shows items in the cart
		get_all_items_in_cart
		redirect_to :controller => "items", :action => "show"
	end

	def index
	end
end
