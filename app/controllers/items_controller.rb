class ItemsController < ApplicationController

  respond_to :html, :json, :xml

  def index
  end

  def show
    @item=Item.find(params[:id])
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

end
