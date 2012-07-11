class Photo < ActiveRecord::Base
  
  belongs_to :photographer, :class_name => "User"
  has_and_belongs_to_many :favourited_users, :class_name => "User", :join_table => "photos_users"
  
  image_accessor :image
  
  validates :image, :presence => true
  validates_property :format, :of => :image, :in => [:jpeg, :jpg, :png, :gif], :message => "must be an image"
  
  scope :popular, joins(:favourited_users).group("photos.id").order("COUNT(users.id)")
    
  # so it can be used in slideshow partial
  def has_video?
    false
  end
  
end