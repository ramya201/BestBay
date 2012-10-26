require "ostruct"

class CartItem < OpenStruct

end

module SimpleCart

end

# NOTE: all public methods works with products, not with their IDs
class Cart

  def initialize
    @items = Array.new
  end

  def self.load(data)
    cart = Cart.new
    unless data.nil?
      data = JSON.parse(data)
      cart.items = data
      @items=cart.items
    end
    return cart
  end

  # returns array of products
  def items
    return @items
  end

  # takes array of products
  def items=(products)
    @items = products.to_a
  end

  def save
    @items.to_json
  end

  def add(product, count = 1)
    #raise ArgumentError unless product.kind_of(@config.product_model)
    item = find(product)
    if item != nil
      init_count = item.fetch("count").to_i
      init_count += count.to_i
      item.store("count", init_count)
    else
      struct = CartItem.new
      struct.cart_item_id = product.id
      struct.count = count.to_i
      @items.push(struct)
      tmp = 1
    end
  end

  # remove all products with id 1
  # cart.remove(1)
  # remove 2 products with id 1
  # cart.remove(1, 2)
  def remove(product, count = nil)
    if item = find(product)
      if count.nil? || item.count <= count
        @items.delete(item)
      elsif item.count > count
        item.count = (item.count - count)
      end
    end
  end

  def empty?
    @items.empty?
  end

  protected
  def find(product)
    if !@items.empty?
      found_item = nil
      @items.map { |item|
        if item.fetch("table").fetch("cart_item_id").eql?(product.id)
          found_item = item.fetch("table")
        end
      }
      return found_item
    end
  end
end
