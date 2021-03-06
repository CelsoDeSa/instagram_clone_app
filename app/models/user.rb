class User < ActiveRecord::Base
  has_many :pictures

  def self.from_omniauth(auth)
  	where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
  		user.provider = auth.provider
  		user.uid = auth.uid
  		user.name = auth.info.name
  		user.oauth_token = auth.credentials.token 
  		user.oauth_expires_at = Time.at(auth.credentials.expires_at)
  		user.save!
  	end
  end

  def facebook
    @facebook ||= Koala::Facebook::API.new(oauth_token)
      block_given? ? yield(@facebook) : @facebook
    rescue Koala::Facebook::APIError => e
      logger.info e.to_s
      nil # or consider a custom null object
  end

  def friends_count #exemplo how to use the code above in connection to koala gem (#361 Railscasts.com)
    facebook { |fb| fb.get_connection("me", "friends").size }
  end
end
