require 'spec_helper'

describe "CategoriesData" do
  describe "Display Metadata" do

    it "should display category metadata from database " do
      category = FactoryGirl.create(:category, :name => "Books")
      visit "/welcome/index"
      click_link "buy_button"
      page.should have_content('Books')
    end

  end
end
