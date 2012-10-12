require 'spec_helper'

describe "Buy or Sell" do

  it "should give user the option to buy" do
    visit "/welcome/index"
    page.should have_link("buy_button", {:id => "buy_button", :href => "/categories/index"})

    click_link "buy_button"
    uri = URI.parse(current_url)
    "#{uri.path}?#{uri.query}".should match("/categories/index")
    page.should have_content('What would you like to buy today?')

  end

  it "should give user the option to sell" do
    visit "/welcome/index"
    page.should have_link("sell_button", {:id => "sell_button", :href => "/seller/index"})

    click_link "sell_button"
    uri = URI.parse(current_url)
    "#{uri.path}?#{uri.query}".should match("/seller/index")
    page.should have_content('My Dashboard')

  end

end