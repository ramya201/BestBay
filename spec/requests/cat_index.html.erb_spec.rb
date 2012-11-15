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

  visit "/categories/index"
  days_passed = (item.end_time.to_date - Date.today).to_i
  page.should have_content("#{days_passed} Days")
  end

  it "removes auction items after end date has passed from the view" do
    user = User.create(:email    => "testuser@abc.com",
                       :password => "ilovegrapes",
                       :first_name => "Test",
                       :last_name => "user")

    visit "/users/sign_in"

    fill_in "Email",    :with => "testuser@abc.com"
    fill_in "Password", :with => "ilovegrapes"

    click_button "Sign in"
    item = FactoryGirl.create(:A3, :name => "Kodak camera 10 megapixel", :user => user)

    visit "/categories/index"
    days_passed = (item.end_time.to_date - Date.today).to_i
    page.should have_no_content("Kodak")
  end
end
