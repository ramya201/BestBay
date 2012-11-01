class CategoriesController < ApplicationController

def index
    @categories = Category.all
    if params.has_key?("search")
          @items = Item.search(params[:search])
    elsif params.has_key?("category_id") and params.has_key?("subcategory_id")
      @items = Item.where("category_id = ? AND subcategory_id = ?", params[:category_id], params[:subcategory_id])
    elsif params.has_key?("other_param")
      @items = Item.find_all_by_user_id(current_user.id)
    end
  end

  def show
    respond_to do |format|
      format.html # index.html
    end
  end

  def new
    @item = Item.new
    @subcategories = Subcategory.all
  end

end
