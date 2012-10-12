class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    if params.has_key?("search")
          @items = Item.search(params[:search])
    elsif params.has_key?("category_id") and params.has_key?("subcategory_id")
      @items = Item.where("category_id = ? AND subcategory_id = ?", params[:category_id], params[:subcategory_id])
    end
  end

  def show
    respond_to do |format|
      format.html # index.html
    end
  end

end
