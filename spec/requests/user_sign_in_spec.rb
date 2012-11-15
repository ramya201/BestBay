require 'spec_helper'



  describe "user sign in" do
    it "allows users to sign in after they have registered" do
      user = User.create(:email    => "testuser@abc.com",
                         :password => "ilovegrapes",
                         :first_name => "Test",
                         :last_name => "user")

      visit "/users/sign_in"

      fill_in "Email",    :with => "testuser@abc.com"
      fill_in "Password", :with => "ilovegrapes"

      click_button "Sign in"

      page.should have_content("Sign Out")
    end
    it "does not allows users to sign in with wrong email" do
      user = User.create(:email    => "testuser@abc.com",
                         :password => "ilovegrapes",
                         :first_name => "Test",
                         :last_name => "user")

      visit "/users/sign_in"

      fill_in "Email",    :with => "abc@abc.com"
      fill_in "Password", :with => "ilovegrapes"

      click_button "Sign in"

      page.should have_content("Sign in")
    end

    it "does not allows users to sign in with wrong password" do
      user = User.create(:email    => "testuser@abc.com",
                         :password => "ilovegrapes",
                         :first_name => "Test",
                         :last_name => "user")

      visit "/users/sign_in"

      fill_in "Email",    :with => "testuser@abc.com "
      fill_in "Password", :with => "ilovgrapes"

      click_button "Sign in"

      page.should have_content("Sign in")
    end

end
