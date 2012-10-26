require "simple_cart"

module CartHelper

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

  def add_to_cart(order_item_id, qty)
    self.initialize_cart unless @cart
    @cart.add(Item.find(order_item_id), qty)
    self.save_cart
  end

  # Remove all the items with responding product and inverted values from cart
  def remove_from_cart(order_item)
    @cart.remove(order_item)
    self.save_cart
  end

  def get_all_items_in_cart
    self.initialize_cart unless @cart
    return @items_in_cart = @cart.items
    tmp = 1
  end

  def get_total_item_count
    self.initialize_cart unless @cart
    item_count = 0
    @cart.items.map { |item|
      item_count += item.fetch("table").fetch("count")
    }
    return item_count
  end
end
