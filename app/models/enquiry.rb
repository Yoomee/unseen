class Enquiry < ActiveRecord::Base
  
  include YmEnquiries::Enquiry
  
  image_accessor :image
  file_accessor :legitimation
  boolean_accessor :agree_to_terms

  validates :image, :legitimation, :length => {:maximum => 10.megabytes}, :allow_blank => true
  validates_property :format, :of => :image, :in => [:jpeg, :jpg, :png, :gif], :message => "must be an image"
  validates :agree_to_terms, :presence => true
    
end