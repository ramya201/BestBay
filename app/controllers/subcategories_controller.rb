class SubcategoriesController < ApplicationController
    
  # routing action
  def list
  end

  # routing action
  def show
  end
  
  # used for view subcategories of a category
  def view_subcategory
    @subcategories = Subcategory.find_all_by_category_id(params[:id])
    respond_to do | format |
      format.js {render :layout => false}
    end
  end

end
