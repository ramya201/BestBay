class ItemsController < ApplicationController

  respond_to :html, :json, :xml
  include CartHelper

  def index
  end

  def show                                    #show item
    @item=Item.find(params[:id])
  end

  def add_item_to_cart()                     #adds items to cart
    @items_in_cart = get_all_items_in_cart
  end

  def new                                   #creates new item
    @item = Item.new
    @categories=Category.all
    @subcategories=[]
  end

  def edit                                   #edits details of item posted by the current user
    @item = Item.find(params[:id])
    @categories=Category.all
    @subcategories=Subcategory.find_all_by_category_id(@item.category_id)
  end

  def update                                 #updates details of item on edit
    @item = Item.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @item = Item.new(params[:item])
    @item.user = User.find(params[:user_id])

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item }
        format.json { render json: @item, status: :created, location: @item }
      else
        format.html { render action: "new" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end

    end

  end

  def search
    respond_with :html
  end

  def destroy

  end

  def subcategories_by_category
    if params[:id].present?
      @subcategories = Subcategory.find_all_by_category_id(params[:id]).map { |sub| [ sub.name , sub.id] }
    else
      @subcategories = []
    end
  end

  def current_sale
       @items  = Item.all
  end

  def get_highest_bid
    @bid = Bid.find_all_by_item_id(params[:id]).sort_by{|e| -e[:amount]}.first()
    if @bid == null_object?
      puts Item.find(params[:id]).price
    elsif
      puts @bid.amount
    end
  end


  def sale_history
    @auction_items = Item.where(:user_id => User.current_user.id, :sale_type => "Auction")
    @instant_items = Item.where(:user_id => User.current_user.id, :sale_type => "Instant Sale")
  end

  def purchase_history
    @transactions =  Transaction.find_all_by_user_id(User.current_user.id)
  end

end
