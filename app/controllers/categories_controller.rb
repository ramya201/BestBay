class CategoriesController < ApplicationController

  #shows items based on the category and sub category
  def index
    @categories = Category.all
    if params.has_key?("search")
      @items = Item.search(params[:search])
    elsif params.has_key?("category_id") and params.has_key?("subcategory_id")
      @items = Item.where("category_id = ? AND subcategory_id = ?", params[:category_id], params[:subcategory_id])
    else
      result = Bid.count(:user_id,:group => "item_id",:order=>"count(user_id) DESC")
      @items = []
      result.keys.each do |key|
        @items << Item.find(key)
      end

    end
    # remove instant sale items whose quantity is less than 1
    # remove ended auction items
    if @items!=nil
      @items.each do |item|
        if item.quantity<1
          @items.delete(item)
        elsif item.end_time!=nil
          if item.end_time<DateTime.current
            @items.delete(item)
          end
        end
      end
    end
  end

  def show
    respond_to do |format|
      format.html # index.html
    end
  end

  def seller_index
    @items = Item.find_all_by_user_id(params[:id])
  end
  def create
    @category = Category.new(params[:bid])

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Category was successfully created!!' }
        format.json { render json: @category, status: :created, location: @category}
      else
        format.html { render action: "new" }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end
end
