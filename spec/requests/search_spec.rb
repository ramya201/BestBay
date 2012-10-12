require 'spec_helper'

describe "Item Search" do

  it "should list search results based on keywords" do
    item = FactoryGirl.create(:item, :name => "Kodak camera 10 megapixel")
    visit "/welcome/index"
    fill_in('search_keyword', :with => 'Kodak')
    click_button "search_submit"
    uri = URI.parse(current_url)
    "#{uri.path}?#{uri.query}".should match("/items")
    page.should have_content('Kodak')
  end

end