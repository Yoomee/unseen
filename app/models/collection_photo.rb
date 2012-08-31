class CollectionPhoto < ActiveRecord::Base
  
  image_accessor :image
  
  validates :image, :presence => true
  validates_property :format, :of => :image, :in => [:jpeg, :jpg, :png, :gif], :message => "must be an image"
  
  def to_s
    line1.presence || line2.presence
  end
  
end