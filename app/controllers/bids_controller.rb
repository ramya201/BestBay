class BidsController < ApplicationController

  # show bids
  def show
    @bids = Bid.where("user_id = ?",User.current_user.id)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bids }
    end
  end

  # GET /bids/new
  # GET /bids/new.json
  def new
    @bid = Bid.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bid }
    end
  end

  # POST /bids
  # POST /bids.json
  def create
    @bid = Bid.new(params[:bid])

    respond_to do |format|
      if @bid.save
        format.html { redirect_to @bid, notice: 'Bid was successfully placed!!' }
        format.json { render json: @bid, status: :created, location: @bid }
      else
        format.html { render action: "new" }
        format.json { render json: @bid.errors, status: :unprocessable_entity }
      end
    end
  end

  # Enable Seller to view current bids on an item
  def view_bids
     @bids = Bid.find_all_by_item_id(params[:id])

     respond_to do |format|
       format.html # view_bids.html.erb
       format.json { render json: @bids }
     end
  end
end
