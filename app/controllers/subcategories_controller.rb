class SubcategoriesController < ApplicationController
  def list
  end

  def show
  end

  def view_subcategory
    @subcategories = Subcategory.find_all_by_category_id(params[:id])
    respond_to do | format |
      format.js {render :layout => false}
    end
  end

end
