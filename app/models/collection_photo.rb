class CollectionPhoto < ActiveRecord::Base
  
  image_accessor :image
  
  validates :image, :presence => true
  validates_property :format, :of => :image, :in => [:jpeg, :JPEG, :jpg, :JPG, :png, :PNG, :gif, :GIF], :message => "must be an image"
  
  def to_s
    line1.presence || line2.presence
  end
  
end