class CartController < ApplicationController
	include CartHelper

	def add
		add_to_cart(params[:item_obj], params[:qty])
		redirect_to :controller => "items", :action => "show"
	end

	def get
		get_all_items_in_cart
		redirect_to :controller => "items", :action => "show"
	end

  def remove
    remove_from_cart(Item.find(params[:id]))
    redirect_to :controller => "cart", :action => "index"
  end

	def index
	end
end
