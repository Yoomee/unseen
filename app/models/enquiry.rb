class Enquiry < ActiveRecord::Base
  
  include YmEnquiries::Enquiry

  scope :for_year, lambda { |year| where("created_at >= ? and created_at <= ?", "#{year}0101", "#{year}1231")}
  
  image_accessor :image
  file_accessor :legitimation
  boolean_accessor :agree_to_terms

  validates :image, :legitimation, :length => {:maximum => 10.megabytes}, :allow_blank => true
  validates_property :format, :of => :image, :in => [:jpeg, :JPEG, :jpg, :JPG, :png, :PNG, :gif, :GIF], :message => "must be an image"
  validates :image, :agree_to_terms, :presence => true
    
end