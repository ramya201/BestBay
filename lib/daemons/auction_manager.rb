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

=begin
  mailing = Mailing.next_for_delivery
  if mailing
    mailing.deliver

  else
    Rails.logger.auto_flushing = true
    Rails.logger.info "This daemon is still running at #{Time.now}.\n"
    sleep 15
  end
=end

  mail = Mail.new do
    from     'me@test.lindsaar.net'
    to       'hiomkar@gmail.com'
    subject  'test from ruby server'
    body     "testing smtp mail from ruby server"
    #add_file :filename => 'somefile.png', :content => File.read('/somefile.png')
  end

  mail.deliver!

  sleep 30

end