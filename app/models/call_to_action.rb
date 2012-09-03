class CallToAction < ActiveRecord::Base

  has_and_belongs_to_many :events
  has_and_belongs_to_many :pages
    
  validates :image, :presence => true
  validates :url, :url => true, :allow_blank => false
  
  image_accessor :image
  
  def to_s
    url.to_s    
  end
end