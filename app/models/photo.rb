class Photo < ActiveRecord::Base
  
  include YmCore::Model
  
  belongs_to :photographer, :class_name => "User"
  has_and_belongs_to_many :collected_by_users, :class_name => "User", :join_table => "photos_users"
  
  image_accessor :image
  
  validates :image, :presence => true
  validates_property :format, :of => :image, :in => [:jpeg, :jpg, :png, :gif], :message => "must be an image"
  
  scope :popular, joins(:collected_by_users).group("photos.id").order("COUNT(users.id) DESC")
    
  # so it can be used in slideshow partial
  def has_video?
    false
  end
  
end