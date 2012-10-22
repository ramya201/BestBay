require "cart/simple"
class WelcomeController < ApplicationController
  def index
  	Cart.product_model = Item
  end
end
