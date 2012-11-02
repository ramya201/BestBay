class CategoriesController < ApplicationController

  #shows items based on the category and sub category
  def index
    @categories = Category.all
    if params.has_key?("search")
          @items = Item.search(params[:search])
    elsif params.has_key?("category_id") and params.has_key?("subcategory_id")
      @items = Item.where("category_id = ? AND subcategory_id = ?", params[:category_id], params[:subcategory_id])
    end
  end

  def show                                      #shows items
    respond_to do |format|
      format.html # index.html
    end
  end

  def seller_index
          @items = Item.find_all_by_user_id(params[:id])
  end
  end
