require "cart/simple_cart"

module CartHelper

  # inits the cart from cookies data
  def initialize_cart
    @cart = cookies[:cart] ? Cart.load(cookies[:cart]) : Cart.new
  end

  # flattens/serializes the cart and saves in cookies
  def save_cart
    cookies[:cart] = @cart.save
  end

  # resets the cart in the cookies
  def reset_cart
    cookies.delete(:cart)
    @cart = Cart.new
  end

  # adds items to the cart
  # items are flattened after addition
  def add_to_cart(order_item_id, qty)
    self.initialize_cart unless @cart
    @cart.add(Item.find(order_item_id), qty)
    self.save_cart
  end

  # removes an item from the cart
  # items are flattened after removal
  def remove_from_cart(order_item)
    self.initialize_cart unless @cart
    @cart.remove(order_item)
    self.save_cart
  end

  # gets all items in the cart
  def get_all_items_in_cart
    self.initialize_cart unless @cart
    return @items_in_cart = @cart.items
  end

  # gets the number of items in the cart
  # if there are 2 laptops and 3 cameras in the cart, then number of items in the cart would be 5
  def get_total_item_count
    self.initialize_cart unless @cart
    item_count = 0
    @cart.items.map { |item|
      item_count += item.fetch("table").fetch("count")
    }
    return item_count
  end
end
