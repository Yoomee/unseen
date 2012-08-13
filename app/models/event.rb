class Event < ActiveRecord::Base

  include YmCore::Model

  belongs_to :venue, :class_name => "Page"
  has_and_belongs_to_many :users
  
  has_and_belongs_to_many :photographers, :class_name => "User", :join_table => "events_photographers"
  has_and_belongs_to_many :galleries, :class_name => "Page", :join_table => "events_galleries", :foreign_key => "event_id", :association_foreign_key => "page_id"
  
  image_accessor :image
  
  validates :title, :date, :starts_at, :ends_at, :venue, :presence => true
  validate :until_date_is_valid
  
  acts_as_taggable_on :categories, :page_tags
  
  scope :popular, joins(:users).group("events.id").order("COUNT(users.id)")
  scope :on_date, lambda {|date| where(["events.date <= :date AND IFNULL(events.until_date, events.date) >= :date", {:date => date}]) }
  
  #validates :image, :presence => true
  #validates_property :format, :of => :image, :in => [:jpeg, :jpg, :png, :gif], :message => "must be an image"
  
  def dates
    [*(date..(until_date || date))]
  end
  
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
  
  def date_time_string
    if dates.size > 1
      date_string = DateTimeSpan.new(date, until_date, "%o %b %Y")
    else
      date_string = date.strftime("%o %b %Y")
    end
    "#{date_string} #{starts_at} - #{ends_at}"
  end
  
  private
  def until_date_is_valid
    if date.present? && until_date.present? && until_date <= date
      errors.add(:until_date, "must be after the date above")
    end
  end
  
end

Event::DATES = (Date.new(2012,9,19)..Date.new(2012,9,23)).to_a