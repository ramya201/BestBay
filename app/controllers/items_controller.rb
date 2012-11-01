class ItemsController < ApplicationController

  respond_to :html, :json, :xml

  include CartHelper

  before_filter :authenticate_user!

  def index
  end

  def show
    @item=Item.find(params[:id])

  end

  def add_item_to_cart()
    @items_in_cart = get_all_items_in_cart
  end

  def new
      @item = Item.new
      @subcategories = Subcategory.all
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
