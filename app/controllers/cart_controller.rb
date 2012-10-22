class CartController < ApplicationController
	# before :initialize_cart
  def initialize_cart
    @cart = cookies[:cart] ? Cart.load(cookies[:cart]) : Cart.new
  end

  def save_cart
    cookies[:cart] = @cart.save
  end

  def reset_cart
    cookies.delete(:cart)
    @cart = Cart.new
  end

  def add_to_cart(order_item)
    self.initialize_cart unless @cart
    @cart.add(order_item)
    self.save_cart
  end

  # Remove all the items with responding product and inverted values from cart
  def remove_from_cart(order_item)
    @cart.remove(order_item)
    self.save_cart
  end

  def get_all_item
    @items_in_cart=@cart.items
  end
end
