class PressRelease < ActiveRecord::Base
  
  include YmCore::Model

  file_accessor :file
  image_accessor :image
  
  validates_property :format, :of => :image, :in => [:jpeg, :JPEG, :jpg, :JPG, :png, :PNG, :gif, :GIF], :message => "must be an image"
  
  default_scope order("date DESC")
  
  def to_s
    title
  end
  
end