class User < ActiveRecord::Base
  
  include YmUsers::User
  
  acts_as_taggable_on :user_tags
  
  def photographer?
    role_is?(:photographer)
  end
  
end
