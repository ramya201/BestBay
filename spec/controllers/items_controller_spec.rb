require 'spec_helper'

describe ItemsController do

  describe "GET 'index'" do

    it "assigns all items to @item" do
      item = FactoryGirl.create(:item, :name => "Kodak camera 10 megapixel")
      get :index
      assigns(:items).should eq([item])
    end

  end

end
