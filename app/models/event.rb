class Event < ActiveRecord::Base
  
  belongs_to :venue, :class_name => "Page"
  
  image_accessor :image
  
  validates :title, :date, :starts_at, :ends_at, :venue, :presence => true
  
  acts_as_taggable_on :categories
  
  #validates :image, :presence => true
  #validates_property :format, :of => :image, :in => [:jpeg, :jpg, :png, :gif], :message => "must be an image"
  
  def starts_at
    read_attribute(:starts_at).try(:strftime,'%H:%M')
  end
  alias_method :starts_at_before_type_cast, :starts_at
  
  def ends_at
    read_attribute(:ends_at).try(:strftime,'%H:%M')
  end
  alias_method :ends_at_before_type_cast, :ends_at  
  
  def time_string
    "#{starts_at} - #{ends_at}"
  end
  
end

Event::DATES = (Date.new(2012,9,19)..Date.new(2012,9,23)).to_a