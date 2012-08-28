class Photo < ActiveRecord::Base
  
  include YmCore::Model
  
  belongs_to :photographer, :class_name => "User"
#  has_and_belongs_to_many :collected_by_users, :class_name => "User", :join_table => "photos_users"
  
  has_many :favourites, :as => :resource
  has_many :collected_by_users, :source => :user, :through => :favourites
  
  image_accessor :image
  
  validates :image, :presence => true
  validates_property :format, :of => :image, :in => [:jpeg, :jpg, :png, :gif], :message => "must be an image"
  
  scope :popular, joins(:favourites).group("photos.id").order("COUNT(favourites.id) DESC")
    
  # so it can be used in slideshow partial
  def has_video?
    false
  end
  
  def image_url_for_api
    return nil if image.nil?
    image.thumb("290x290").url
  end
  
end