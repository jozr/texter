require 'rails_helper'

describe Message, :vcr => true do
	it "doesn't save the message if twilio gives an error" do
		message = Message.new(:body => 'hi', :to => '111111', :from => '3139243590')
		message.save.should be_falsey
	end
end