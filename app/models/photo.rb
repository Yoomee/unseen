class Photo < ActiveRecord::Base
  
  include YmCore::Model
  
  before_save :set_edition
  
  belongs_to :photographer, :class_name => "User"
#  has_and_belongs_to_many :collected_by_users, :class_name => "User", :join_table => "photos_users"
  
  has_many :favourites, :as => :resource, :dependent => :destroy
  has_many :collected_by_users, :source => :user, :through => :favourites
  has_and_belongs_to_many :galleries, :class_name => "Page", :join_table => "galleries_photos", :association_foreign_key => "gallery_id"
  
  image_accessor :image
  
  validates :image, :presence => true
  validates_property :format, :of => :image, :in => [:jpeg, :JPEG, :jpg, :JPG, :png, :PNG, :gif, :GIF], :message => "must be an image"
  
  scope :popular, joins(:favourites).group("photos.id").order("COUNT(favourites.id) DESC")
  scope :from_edition, lambda {|edition| joins(:photographer).where(:users => {:edition => edition})}
    
  # so it can be used in slideshow partial
  def has_video?
    false
  end
  
  def image_url_for_api
    return nil if image.nil?
    image.thumb("290x290").url
  end
  
  private
  def set_edition
    self.edition = photographer.try(:edition)
  end
  
end