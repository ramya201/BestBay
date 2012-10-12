class ItemsController < ApplicationController

  respond_to :html, :json, :xml

  def index
    @items = Item.search(params[:search])
    if params.has_key?("search")
    elsif params.has_key?("category_id") and params.has_key?("subcategory_id")
      @items = Item.where("category_id = ? AND subcategory_id = ?", params[:category_id], params[:subcategory_id])
    end
  end

  def show
    @item=Item.find(params[:id])
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
