module User::LinkedinAuth

  def self.included(base)
    base.validate :linkedin_uid, :uniqueness => true
    base.boolean_accessor :just_connected_linkedin
    base.extend ClassMethods
  end
  
  module ClassMethods
    
    def find_or_create_by_linkedin_oauth(auth, current_user = nil)
      if current_user
        user = current_user
        if current_user.linkedin_uid.present?
          if current_user.linkedin_uid != auth.uid          
            raise ConnectedWithDifferentAccountError
          end
        elsif User.exists?(:linkedin_uid => auth.uid)
          raise AccountAlreadyUsedError
        else
          user.image_url = auth.extra.raw_info.pictureUrl if user.image.nil?
          set_linkedin_uid(user, auth.uid) # connecting user for the first time while logged in
        end
      elsif user = User.find_by_linkedin_uid(auth.uid)
        return user # found user
      elsif user = User.find_by_email(auth.extra.raw_info.emailAddress)
        user.image_url = auth.extra.raw_info.pictureUrl if user.image.nil?
        set_linkedin_uid(user, auth.uid) # connecting user for the first time while logged out
      else
        # creating account for first time
        user = User.new(
          :first_name => auth.extra.raw_info.firstName,
          :last_name => auth.extra.raw_info.lastName,
          :email => auth.extra.raw_info.emailAddress,
          :image_url => auth.extra.raw_info.pictureUrl
        )
        user.password = Devise.friendly_token[0,20]
        set_linkedin_uid(user, auth.uid)
      end
      user.save
      user
    end
    
    private
    def set_linkedin_uid(user, auth_uid)
      user.just_connected_linkedin = true
      user.linkedin_uid = auth_uid
    end
    
  end
  
  class ConnectedWithDifferentAccountError < StandardError; end
  class AccountAlreadyUsedError < StandardError; end
  
end
