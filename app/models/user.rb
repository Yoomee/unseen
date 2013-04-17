class User < ActiveRecord::Base

  include YmUsers::User
  include User::FacebookAuth
  include User::LinkedinAuth
  include User::TwitterAuth

  devise :omniauthable

  has_many :photos, :foreign_key => "photographer_id", :dependent => :destroy
  has_many :links, :as => :attachable, :class_name => "YmLinks::Link", :dependent => :destroy
  has_many :favourites, :dependent => :destroy
  has_many :favourites_as_photographer, :as => :resource, :class_name => "Favourite", :dependent => :destroy
  has_many :favourited_by_users, :source => :user, :through => :favourites_as_photographer, :uniq => true
  has_and_belongs_to_many :galleries, :class_name => "Page", :join_table => "galleries_photographers"
  has_and_belongs_to_many :events, :order => "starts_at DESC, date"
  belongs_to :photographer_parent
  
  acts_as_taggable_on :user_tags, :page_tags

  before_save :build_photographer_parent
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
  
  class << self
    def find_by_api_key(api_key)
      return nil if api_key.blank?
      find_by_id(
        Encryptor.decrypt(
          Base64.decode64(api_key.tr("-_","+/")),
          :key => Digest::SHA256.hexdigest(User::API_SECRET)
        )
      )
    end
  end
  
  def address
    %w{city country}.map {|fld| send(fld)}.select(&:present?).join(', ')
  end
  
  def address_changed?
    city_changed? || country_changed?
  end
  
  def api_key
    Base64.encode64(
      Encryptor.encrypt(
        id.to_s,
        :key => Digest::SHA256.hexdigest(User::API_SECRET)
      )
    ).strip.tr("+/","-_")
  end
  
  def as_json(options ={})
    serializable_hash(options).tap do |hash|
      hash["bio"] = @template.strip_tags(hash["bio"].to_s).gsub('&nbsp;', ' ') if hash["bio"]
    end
  end
  
  def create_photographer_clone(edition)
    clone = User.new(:role => 'photographer', :edition => edition)
    clone.first_name = first_name
    clone.last_name = last_name
    clone.bio =  bio
    clone.image_uid = image_uid
    clone.email = "#{edition}_#{email}"
    clone.password = "#{first_name} #{edition}"
    clone.password_confirmation = clone.password 
    clone.job_title = job_title
    clone.photographer_parent_id = photographer_parent_id
    clone.save
    clone
  end
  
  def editions_with_favourite_photos
    Photo.where(['id IN (?)', favourites.photos.collect(&:resource_id)]).group(:edition).collect(&:edition)
  end
  
  def favourite_photos_for_edition(edition)
    Photo.where(['id IN (?) AND edition = ?', favourites.photos.collect(&:resource_id), edition])
  end
  
  def has_lat_lng?
    lat.present? && lng.present?
  end
  
  def has_latest_edition?
    photographer_parent.photographers.last.edition == Settings.edition.latest
  end
  
  def image_url_for_api
    return nil if image.nil?
    image.thumb("55x55#").url
  end
  
  def lat_lng_or_default
    has_lat_lng? ? [lat,lng] : User::DEFAULT_LOCATION
  end

  def photographer?
    role_is?(:photographer)
  end
  
  def profiles
    photographer_parent.photographers
  end
  
  def text
    bio
  end

  private  
  def record_activity  
    record_activity!(self)  
  end
  
  def build_photographer_parent
    if role == "photographer" && photographer_parent.nil?
      self.photographer_parent = PhotographerParent.create
    end
  end

end

User::DEFAULT_LOCATION = [52.3744,4.898]
User::API_SECRET = "'?8v@3Y?iYM#6@i7-)isU!7AR8FV4yT"
