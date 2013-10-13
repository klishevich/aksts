class Message < ActiveRecord::Base
  # require 'twitter'

  attr_accessible :body, :title, :send_to_subscribers, :send_to_twitter, :send_to_facebook, :send_to_vkontakte, 
  :temp

  validates :title, presence: true, length: {maximum: 100}
  validates :body, presence: true

  validate :correct_twit

  default_scope order: 'messages.created_at DESC'

  def correct_twit
    str1= ""+I18n.t('too_long_twit').to_s + self.body.length.to_s
    self.errors[:base] << str1 if (self.body.length > 140 && self.send_to_twitter)
  end

# Delivers to subscribers via email
  def deliver
    User.all.each do |user|
      UserMailer.send_message(user,self).deliver
    end
  end
  handle_asynchronously :deliver

  def send_twitter
    # access_token = prepare_access_token("1331117659-1tncSuQnajKxEttebJFOgJFzxZZoZN7oF0Ls0CL", "elas4wTZLUQbMSAwEzyMogHI7soV75noBFVhhzCHHjM")
    # response = access_token.request(:get, "https://api.twitter.com/1.1/statuses/home_timeline.json")
    # self.temp = response
    Twitter.configure do |config|
      config.consumer_key        = "UmSj46NSWsp8ZOY621d8w"
      config.consumer_secret     = "OFMxr1t1jiDdaYb3nC4pjvU4vZVDT4FCrRFjwKy5f5M"
      config.oauth_token        = "1331117659-1tncSuQnajKxEttebJFOgJFzxZZoZN7oF0Ls0CL"
      config.oauth_token_secret = "elas4wTZLUQbMSAwEzyMogHI7soV75noBFVhhzCHHjM"
    end
    Twitter.update(self.body)
  end
  handle_asynchronously :send_twitter

  private

  # def prepare_access_token(oauth_token, oauth_token_secret)
  #   consumer = OAuth::Consumer.new("UmSj46NSWsp8ZOY621d8w", "OFMxr1t1jiDdaYb3nC4pjvU4vZVDT4FCrRFjwKy5f5M",
  #     { :site => "http://api.twitter.com",
  #       :scheme => :header
  #     })

  #   token_hash = { :oauth_token => oauth_token,
  #                  :oauth_token_secret => oauth_token_secret
  #                }
  #   access_token = OAuth::AccessToken.from_hash(consumer, token_hash )
  #   return access_token
  # end

end
