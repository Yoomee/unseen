class Photo < ActiveRecord::Base
  
  belongs_to :photographer, :class_name => "User"
  
  image_accessor :image
  
  validates :image, :presence => true
  validates_property :format, :of => :image, :in => [:jpeg, :jpg, :png, :gif], :message => "must be an image"
  
  # so it can be used in slideshow partial
  def has_video?
    false
  end
  
end