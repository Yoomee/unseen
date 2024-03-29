module User::FacebookAuth

  def self.included(base)
    base.validate :facebook_uid, :uniqueness => true
    base.boolean_accessor :just_connected_facebook
    base.extend ClassMethods
  end
  
  module ClassMethods
    
    def find_or_create_by_facebook_oauth(auth, current_user = nil)
      if current_user
        user = current_user
        if current_user.facebook_uid.present?
          if current_user.facebook_uid != auth.uid          
            raise ConnectedWithDifferentAccountError
          end
        elsif User.exists?(:facebook_uid => auth.uid)
          raise AccountAlreadyUsedError
        else
          set_facebook_uid(user, auth.uid) # connecting user for the first time while logged in
        end
      elsif user = User.find_by_facebook_uid(auth.uid)
        return user # found user
      elsif user = User.find_by_email(auth.extra.raw_info.email)
        set_facebook_uid(user, auth.uid) # connecting user for the first time while logged out
      else
        # creating account for first time
        user = User.new(auth.extra.raw_info.to_hash.slice('first_name', 'last_name', 'email'))
        user.password = Devise.friendly_token[0,20]
        set_facebook_uid(user, auth.uid)
      end
      user.save
      user
    end
    
    private
    def set_facebook_uid(user, auth_uid)
      user.just_connected_facebook = true
      user.facebook_uid = auth_uid
      user.image_url = "http://graph.facebook.com/#{auth_uid}/picture?type=large" if user.image.nil?
    end
    
  end
  
  class ConnectedWithDifferentAccountError < StandardError; end
  class AccountAlreadyUsedError < StandardError; end
  
end