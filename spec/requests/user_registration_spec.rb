require 'spec_helper'

describe "UserRegistration" do

    it "allows users to sign up with email id name and password " do

      visit "/users/sign_up"


      fill_in "First name", :with => "Test"
      fill_in "Last name", :with => "User"
      fill_in "Email", :with => "testuser@abc.com"
      fill_in "Password", :with => "passw123"
      fill_in "Password confirmation", :with => "passw123"

      click_button "Create my account"
      visit "/categories/index"
      page.should have_content('Test')
    end

    it "do not allow password less than length 6 " do

      visit "/users/sign_up"


      fill_in "First name", :with => "Test"
      fill_in "Last name", :with => "User"
      fill_in "Email", :with => "testuser@abc.com"
      fill_in "Password", :with => "passw"
      fill_in "Password confirmation", :with => "passw"

      click_button "Create my account"
      page.should have_content('Sign up')
    end


    it "do not allow invalid email id " do

      visit "/users/sign_up"


      fill_in "First name", :with => "Test"
      fill_in "Last name", :with => "User"
      fill_in "Email", :with => "testuser.com"
      fill_in "Password", :with => "passw123"
      fill_in "Password confirmation", :with => "passw123"

      click_button "Create my account"
      page.should have_content('Sign up')
    end


    it "do not allow empty email " do

      visit "/users/sign_up"


      fill_in "First name", :with => "Test"
      fill_in "Last name", :with => "User"
      fill_in "Email", :with => ""
      fill_in "Password", :with => "passw123"
      fill_in "Password confirmation", :with => "passw123"

      click_button "Create my account"
      page.should have_content('Sign up')
    end

    it "do not allow empty first name " do

      visit "/users/sign_up"


      fill_in "First name", :with => ""
      fill_in "Last name", :with => "User"
      fill_in "Email", :with => "testuser@abc.com"
      fill_in "Password", :with => "passw123"
      fill_in "Password confirmation", :with => "passw123"

      click_button "Create my account"
      page.should have_content('Sign up')
    end

    it "do not allow empty last name " do

      visit "/users/sign_up"


      fill_in "First name", :with => "Test"
      fill_in "Last name", :with => ""
      fill_in "Email", :with => "testuser@abc.com"
      fill_in "Password", :with => "passw123"
      fill_in "Password confirmation", :with => "passw123"

      click_button "Create my account"
      page.should have_content('Sign up')
    end



end
