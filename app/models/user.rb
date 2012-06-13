class User < ActiveRecord::Base
  
  include YmUsers::User
  
  has_many :photos, :foreign_key => "photographer_id"
  has_many :links, :as => :attachable, :class_name => "YmLinks::Link", :dependent => :destroy
  has_and_belongs_to_many :galleries, :class_name => "Page", :join_table => "galleries_photographers"
  
  acts_as_taggable_on :user_tags
  
  accepts_nested_attributes_for :photos, :links, :reject_if => :all_blank, :allow_destroy => true
  
  def photographer?
    role_is?(:photographer)
  end
  
end
