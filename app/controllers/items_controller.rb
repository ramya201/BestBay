class ItemsController < ApplicationController

  respond_to :html, :json, :xml

  include CartHelper

  def index
  end

  def show
    @item=Item.find(params[:id])

  end

  def add_item_to_cart()
    @items_in_cart = get_all_items_in_cart
  end

  def new
  end

  def edit
  end

  def destroy
  end

  def search
    respond_with :html
  end

end
