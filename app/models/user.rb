class User < ActiveRecord::Base
  
  include YmUsers::User
  
  has_many :photos, :foreign_key => "photographer_id"
  
  acts_as_taggable_on :user_tags
  
  accepts_nested_attributes_for :photos, :reject_if => :all_blank, :allow_destroy => true
  
  def photographer?
    role_is?(:photographer)
  end
  
end
