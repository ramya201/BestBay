require 'spec_helper'

describe "CategoriesData" do
=begin
  describe "Display Metadata" do

    it "should display category metadata from database " do
      category = FactoryGirl.create(:category, :name => "Electronics")
      visit "/categories/index"
      page.should have_content('Electronics')
    end

  end
=end
end
