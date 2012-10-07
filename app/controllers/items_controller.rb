class ItemsController < ApplicationController

  respond_to :html, :json, :xml

  def index
    @items = Item.search(params[:search])
  end

  def show
  end

  def new
  end

  def edit
  end

  def destroy
  end
end
