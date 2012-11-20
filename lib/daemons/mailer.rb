#!/usr/bin/env ruby

require 'mail'


# You might want to change this
ENV["RAILS_ENV"] ||= "development"

root = File.expand_path(File.dirname(__FILE__))
root = File.dirname(root) until File.exists?(File.join(root, 'config'))
require File.join(root, "config", "environment")

$running = true
Signal.trap("TERM") do
  $running = false
end

while($running) do
@items = Item.find_all_by_sale_type("Auction")
@items.each do |item|
  #time_left = Time.parse(item.end_time.to_s) - Time.parse(Time.now.to_s)
  time_left = -1
  if time_left < 0
      amount =  Bid.where(:item_id => item.id).maximum("amount")
      user = Bid.where(:amount => amount,:item_id => item.id).first.user

      mail = Mail.new do
        from     'juggernauts.bestbay@gmail.com'
        to       item.user.email
        subject  "Auction for " + item.name
        body     "Your Auction for " + item.name + " has ended. The highest bidder is " + user.first_name + ".The bid amount is $" + amount.to_s


        #add_file :filename => 'somefile.png', :content => File.read('/somefile.png')
      end
      mail.delivery_method :sendmail
      mail.deliver!
      puts "Sending mail to Seller..!"


      mail = Mail.new do
        from     'juggernauts.bestbay@gmail.com'
        to       user.email
        subject  "Auction Won!!"
        body     "Congratulations! You won " + item.name + " for $" + amount.to_s


        #add_file :filename => 'somefile.png', :content => File.read('/somefile.png')
      end
      mail.delivery_method :sendmail
      mail.deliver!
      puts "Sending mail to Buyer..!"
      sleep 60


  end
end
end

