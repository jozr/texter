class Message < ActiveRecord::Base
  
  before_create :send_sms

private

  def send_sms
    begin
    response = RestClient::Request.new(
      :method => :post,
      :url => 'https://api.twilio.com/2010-04-01/Accounts/AC595dc6447d9d18e63e8ee1c6a10a9f54/Messages.json',
      :user => ENV['TWILIO_ACCOUNT_SID'],
      :password => ENV['TWILIO_AUTH_TOKEN'],
      :payload => { :Body => body,
                    :From => from,
                    :To => to }
      ).execute

    rescue
      false
    end

  end
end