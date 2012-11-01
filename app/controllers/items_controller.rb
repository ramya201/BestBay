class ItemsController < ApplicationController

  respond_to :html, :json, :xml

  include CartHelper

  before_filter :authenticate_user!

  def index
  end

  def show                                    #show item
    @item=Item.find(params[:id])

  end

  def add_item_to_cart()                     #adds items to cart
    @items_in_cart = get_all_items_in_cart
  end

<<<<<<< HEAD
  def new
      @item = Item.new
      @subcategories = Subcategory.all
=======
  def new                                   #creates new item
    @item = Item.new
    @subcategories = Subcategory.all
>>>>>>> 72f38be05b85599c6f941d7173112d6ec8e9032f
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(params[:item])

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item }
        format.json { render json: @item, status: :created, location: @item }
      else
        #format.html { render action: "new" }
        #format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def search
    respond_with :html
  end

  def authenticate_user
    if request.xhr?
      flash.now[:alert] = 'Error'
      render :js => "window.location = '/users/sign_up'"
    else
      authenticate_user!
    end
  end

end
