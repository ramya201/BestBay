require 'spec_helper'

describe "categories/index.html.erb" do
  it "shows users the number of days left on an auction" do
  user = User.create(:email    => "testuser@abc.com",
                     :password => "ilovegrapes",
                     :first_name => "Test",
                     :last_name => "user")

  visit "/users/sign_in"

  fill_in "Email",    :with => "testuser@abc.com"
  fill_in "Password", :with => "ilovegrapes"

  click_button "Sign in"
  item = FactoryGirl.create(:A2, :name => "Kodak camera 10 megapixel", :user => user, :end_time => "2012-12-15")
=begin
  item = Item.create(:name => "test",
                     :description => "test test test",
                     :quantity => "2",
                     :price => "50",
                     :sale_type => "Auction",
                     :start_time => "2012-11-02",
                     :end_time => "2012-12-15",
                     :brand_id => "1",
                     :category_id => "1",
                     :subcategory_id => "1",
                     :user => user)
=end

  visit "/categories/index"
  days_passed = (item.end_time.to_date - Date.today).to_i
  page.should have_content("#{days_passed} Days")
    end
end
