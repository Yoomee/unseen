class User < ActiveRecord::Base

  include YmUsers::User
  include User::FacebookAuth
  include User::LinkedinAuth
  include User::TwitterAuth

  devise :omniauthable

  has_many :photos, :foreign_key => "photographer_id"
  has_many :links, :as => :attachable, :class_name => "YmLinks::Link", :dependent => :destroy
  has_many :favourites, :dependent => :destroy  
  has_and_belongs_to_many :galleries, :class_name => "Page", :join_table => "galleries_photographers"
  has_and_belongs_to_many :events, :order => "starts_at DESC, date"
  
  acts_as_taggable_on :user_tags, :page_tags

  after_create :record_activity
  geocoded_by :address, :latitude  => :lat, :longitude => :lng
  after_validation :geocode,  :if => lambda{ |obj| obj.address_changed? }

  accepts_nested_attributes_for :photos, :links, :reject_if => :all_blank, :allow_destroy => true

  define_index do
    indexes first_name, last_name, job_title, bio
    has created_at, updated_at
    set_property :enable_star => 1
    set_property :min_infix_len => 3
  end
  
  def address
    %w{city country}.map {|fld| send(fld)}.select(&:present?).join(', ')
  end
  
  def address_changed?
    city_changed? || country_changed?
  end
  
  def has_lat_lng?
    lat.present? && lng.present?
  end
  
  def lat_lng_or_default
    has_lat_lng? ? [lat,lng] : User::DEFAULT_LOCATION
  end

  def photographer?
    role_is?(:photographer)
  end

  private  
  def record_activity  
    record_activity!(self)  
  end

end

User::DEFAULT_LOCATION = [52.3744,4.898]
