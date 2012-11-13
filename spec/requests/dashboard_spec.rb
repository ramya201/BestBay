require 'spec_helper'

describe "dashboard" do

  it "should show items that the user is selling" do
    user = User.create(:email    => "testuser@abc.com",
                       :password => "ilovegrapes",
                       :first_name => "Test",
                       :last_name => "user")

    visit "/users/sign_in"

    fill_in "Email",    :with => "testuser@abc.com"
    fill_in "Password", :with => "ilovegrapes"

    click_button "Sign in"

    item = FactoryGirl.create(:item, :name => "Kodak camera 10 megapixel", :user => user)

    click_link "Current Sale"

   page.should have_content('Kodak')
  end

  it "should show items that the user is selling" do
    user1 = User.create(:email    => "testuser@abc.com",
                       :password => "ilovegrapes",
                       :first_name => "Test",
                       :last_name => "user")

    visit "/users/sign_in"
    fill_in "Email",    :with => "testuser@abc.com"
    fill_in "Password", :with => "ilovegrapes"
    click_button "Sign in"
    item = FactoryGirl.create(:item, :name => "Kodak camera 10 megapixel", :user => user1)
    click_link "Current Sale"
    page.should have_content('Kodak')

    visit "/welcome/index"
    click_link "Sign Out"

    user2 = User.create(:email    => "testuser2@abc.com",
                        :password => "ilovegrapes",
                        :first_name => "Test",
                        :last_name => "user")

    visit "/users/sign_in"
    fill_in "Email",    :with => "testuser2@abc.com"
    fill_in "Password", :with => "ilovegrapes"
    click_button "Sign in"
    item = FactoryGirl.create(:item, :name => "Sony camera 10 megapixel", :user => user2)
    click_link "Current Sale"
    page.should have_content('Sony')
    page.should have_no_content('Kodak')

  end

end