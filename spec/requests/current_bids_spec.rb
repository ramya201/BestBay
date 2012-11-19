=begin
require "rspec"
require 'spec_helper'

describe "Place Bid" do

  def setup
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in FactoryGirl.create(:current_user)
  end

  it "should place a bid" do
    @user_attr = FactoryGirl.attributes_for(:user)
    user = User.create!(@user_attr)
    item = FactoryGirl.create(:item,:user => user)

    visit "items#show"
    fill_in('bid_amount', :with => '400')
    click_button "bid_submit"
    uri = URI.parse(current_url)
    "#{uri.path}?#{uri.query}".should match("/bids")
    page.should have_content('Bid has been successfully submitted')

  end

end
=end
