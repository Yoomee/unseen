class User < ActiveRecord::Base

  include YmUsers::User

  has_many :photos, :foreign_key => "photographer_id"
  has_many :links, :as => :attachable, :class_name => "YmLinks::Link", :dependent => :destroy
  has_and_belongs_to_many :galleries, :class_name => "Page", :join_table => "galleries_photographers"
  has_and_belongs_to_many :events, :order => "starts_at DESC, date"
  has_and_belongs_to_many :favourite_photos, :class_name => "Photo", :join_table => "photos_users"
  
  acts_as_taggable_on :user_tags, :page_tags

  after_create :record_activity  

  accepts_nested_attributes_for :photos, :links, :reject_if => :all_blank, :allow_destroy => true

  define_index do
    indexes first_name, last_name, job_title, bio
    has created_at, updated_at
    set_property :enable_star => 1
    set_property :min_infix_len => 3
  end

  def photographer?
    role_is?(:photographer)
  end

  private  
  def record_activity  
    record_activity!(self)  
  end

end
