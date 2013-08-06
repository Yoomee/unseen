class CollectionPhoto < ActiveRecord::Base
  
  image_accessor :image
  
  validates :image, :presence => true
  validates_property :format, :of => :image, :in => [:jpeg, :JPEG, :jpg, :JPG, :png, :PNG, :gif, :GIF], :message => "must be an image"
  
  def current_edition?
    new_record? || edition.blank? || edition == Settings.current_edition
  end
  
  def contactable?
    email.present? && (edition.blank? || edition == Settings.current_edition || edition == 'bgl')
  end
  
  def to_s
    line1.presence || line2.presence
  end
  
end