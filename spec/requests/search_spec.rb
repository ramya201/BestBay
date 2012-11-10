require 'spec_helper'

describe "Item Search" do

  it "should list search results based on keywords" do
    @user_attr = FactoryGirl.attributes_for(:user)
    user = User.create!(@user_attr)
    item = FactoryGirl.create(:item, :name => "Kodak camera 10 megapixel", :user => user)
    visit "/welcome/index"
    fill_in('search_keyword', :with => 'Kodak')
    click_button "search_submit"
    uri = URI.parse(current_url)
    "#{uri.path}?#{uri.query}".should match("/categories")
    page.should have_content('Kodak')
  end

end