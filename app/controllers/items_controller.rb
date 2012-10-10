class ItemsController < ApplicationController

  respond_to :html, :json, :xml

  def index
    #
    #render :file => '/categories/index', :layout => true
    logger.info "items index.................................."
    #redirect_to categories_path :layout => "true", :format => 'html', :search => params[:search]
    #redirect_to 'http://rubyonrails.org', :format => 'html'
    #redirect_to :controller => 'categories', :action => 'index', :format => 'html'
=begin
    respond_to do | format |
      format.js  {redirect_to :controller => 'categories', :action => 'index', :format => 'html'}
    end
=end

    @items = Item.search(params[:search])
=begin
    respond_to do | format |
      format.js {redirect_to :controller => 'categories', :action => 'index', :format => 'html'}
    end
=end
    #render :file => '/categories/index', :layout => true
    #logger.info "redirect.................................."

    if params.has_key?("search")
    elsif params.has_key?("category_id") and params.has_key?("subcategory_id")
      @items = Item.where("category_id = ? AND subcategory_id = ?", params[:category_id], params[:subcategory_id])
    end
=begin
    respond_to do | format |
      format.js
    end
=end

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
