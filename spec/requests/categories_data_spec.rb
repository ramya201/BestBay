require 'spec_helper'

describe "CategoriesData" do
  describe "Display Metadata" do

    it "should display category metadata from database " do
      category = FactoryGirl.create(:category, :name => "Electronics")
      visit "/welcome/index"
      click_link "buy_button"
      page.should have_content('Electronics')
    end

  end
end
