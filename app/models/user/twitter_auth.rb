module User::TwitterAuth

  def self.included(base)
    base.validate :twitter_uid, :uniqueness => true
    base.boolean_accessor :just_connected_twitter
    base.extend ClassMethods
  end
  
  module ClassMethods
    
    def find_or_create_by_twitter_oauth(auth, current_user = nil)
      puts "auth = #{auth.inspect}"
      if current_user
        user = current_user
        if current_user.twitter_uid.present?
          if current_user.twitter_uid != auth.uid
            raise ConnectedWithDifferentAccountError
          end
        elsif User.exists?(:twitter_uid => auth.uid)
          raise AccountAlreadyUsedError
        else
          set_twitter_uid(user, auth) # connecting user for the first time while logged in
        end
      elsif user = User.find_by_twitter_uid(auth.uid)
        return user # found user
      elsif user = User.find_by_email(auth.extra.raw_info.email)
        set_twitter_uid(user, auth) # connecting user for the first time while logged out
      else
        # creating account for first time
        # TODO: can't get email from Twitter!!!
        user = User.new(
          :email => auth.extra.raw_info.email,
          :full_name => auth.extra.raw_info.name,
          :password => Devise.friendly_token[0,20]
        )
        user.last_name ||= user.first_name
        set_twitter_uid(user, auth)
      end
      user.save
      user
    end
    
    private
    def set_twitter_uid(user, auth)
      user.just_connected_twitter = true
      user.twitter_uid = auth.uid
      if user.image.nil?
        user.image_url = "https://api.twitter.com/1/users/profile_image?screen_name=#{auth.extra.raw_info.screen_name}&size=original"
      end
    end
    
  end
  
  class ConnectedWithDifferentAccountError < StandardError; end
  class AccountAlreadyUsedError < StandardError; end
  
end