class Message < ActiveRecord::Base
  before_create :send_sms

private

  def send_sms
    response = RestClient::Request.new(
      :method => :post,
      :url => 'https://api.twilio.com/2010-04-01/Accounts/AC595dc6447d9d18e63e8ee1c6a10a9f54/Messages.json',
      :user => 'AC595dc6447d9d18e63e8ee1c6a10a9f54',
      :password => '9f85ee8193d1bd7a50741a23e85a7d7e',
      :payload => { :Body => body,
                    :From => from,
                    :To => to }
      ).execute
  end
end
