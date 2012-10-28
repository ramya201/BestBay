require "ostruct"

# This class is an open dynamic structure for a CartItem
class CartItem < OpenStruct
end

# This class is holds the cart items and deals with adding and removing them
class Cart

  # inits cart with empty array of items
  def initialize
    @items = Array.new
  end

  # loads cart with items stored in cookies in JSON format
  def self.load(data)
    cart = Cart.new
    unless data.nil?
      data = JSON.parse(data)
      cart.items = data
      @items=cart.items
    end
    return cart
  end

  # returns array of items
  def items
    return @items
  end

  # takes array of items
  def items=(selected_items)
    @items = selected_items.to_a
  end

  # flattens/serializes items array to JSON string format
  def save
    @items.to_json
  end

  # adds items to the cart, by default adds one item
  # if item already exists then increases item count, otherwise creates new CartItem
  def add(selected_item, count = 1)
    item = find_item(selected_item)
    if item != nil
      init_count = item.fetch("count").to_i
      init_count += count.to_i
      item.store("count", init_count)
    else
      struct = CartItem.new
      struct.cart_item_id = selected_item.id
      struct.count = count.to_i
      @items.push(struct)
    end
  end

  # remove all selected_items with id 1
  # cart.remove(1)
  # remove 2 selected_items with id 1
  # cart.remove(1, 2)
  def remove(selected_item, count = nil)
    if item = find_item(selected_item)
      if count.nil? || item["count"] <= count
        @items.delete_at(find_item_index(selected_item))
      elsif item["count"] > count
        item["count"] = (item["count"] - count)
      end
    end
  end

  # checks if items in cart are empty
  def empty?
    @items.empty?
  end

  # this is a facade method for finding an item in the cart
  def find_item(selected_item)
    return find(selected_item)
  end

  # finds an item in the cart items array
  # the items array contains flattened/serialized items
  protected
  def find(selected_item)
    if !@items.empty?
      found_item = nil
      @items.map { |item|
        if item.fetch("table").fetch("cart_item_id").eql?(selected_item.id)
          found_item = item.fetch("table")
        end
      }
      return found_item
    end
  end

  # finds the index of an existing item in the items array
  # useful for removing items from array
  protected
  def find_item_index(selected_item)
    if !@items.empty?
      found_item = nil
      iterator = 0
      found_item_index = 0
      @items.map { |item|
        #item = JSON.parse(item.to_json)
        if item.fetch("table").fetch("cart_item_id").eql?(selected_item.id)
          found_item_index = iterator
        end
        iterator += iterator
      }
      return found_item_index
    end
  end

end
