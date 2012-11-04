class TransactionsController < ApplicationController


  def new

    @_controller.get_all_items_in_cart.to_s
  end



end
