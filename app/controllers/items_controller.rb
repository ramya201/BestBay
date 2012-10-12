class ItemsController < ApplicationController

  respond_to :html, :json, :xml

  def index
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
