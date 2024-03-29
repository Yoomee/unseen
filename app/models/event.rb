class Event < ActiveRecord::Base

  include YmCore::Model

  belongs_to :venue, :class_name => "Page"
  has_and_belongs_to_many :users
  
  has_and_belongs_to_many :photographers, :class_name => "User", :join_table => "events_photographers"
  has_and_belongs_to_many :galleries, :class_name => "Page", :join_table => "events_galleries", :foreign_key => "event_id", :association_foreign_key => "page_id"
  
  has_many :favourites, :as => :resource, :dependent => :destroy, :conditions => {:deleted => false}
  has_many :favourited_by_users, :source => :user, :through => :favourites, :uniq => true
  
  has_and_belongs_to_many :call_to_actions
  
  has_many :activity_items, :class_name => "YmActivity::ActivityItem", :dependent => :destroy, :as => :resource

  has_many :related_items, :as => :resource
  has_many :related_pages, :through => :related_items, :class_name => 'Page', :source => :item, :source_type => 'Page'
  has_many :related_events, :through => :related_items, :class_name => 'Event', :source => :item, :source_type => 'Event'

  image_accessor :image
  
  validates :title, :date, :starts_at, :ends_at, :venue, :presence => true
  validate :until_date_is_valid
  
  before_save :set_api_image_fields
  
  acts_as_taggable_on :categories, :page_tags
  
  #scope :popular, joins(:users).group("events.id").order("COUNT(users.id)")
  scope :popular, joins(:favourites).where("favourites.deleted = 0").group("events.id").order("COUNT(favourites.id) DESC")
  
  scope :on_date, lambda {|date| where(["events.date <= :date AND IFNULL(events.until_date, events.date) >= :date", {:date => date}]) }
  
  #validates :image, :presence => true
  #validates_property :format, :of => :image, :in => [:jpeg, :JPEG, :jpg, :JPG, :png, :PNG, :gif, :GIF], :message => "must be an image"
  
  class << self
    
    def festival_dates(edition = Settings.current_edition)
      Event::FESTIVAL_DATES[edition].to_a
    end
    
  end
  
  
  def as_json(options ={})
    serializable_hash(options).tap do |hash|
      hash["title"] = @template.strip_tags(hash["title"].to_s).gsub('&nbsp;', ' ') if hash["title"].present?
      hash["description"] = @template.strip_tags(hash["description"].to_s).gsub('&nbsp;', ' ') if hash["description"].present?
    end
  end
  
  def dates
    [*(date..(until_date || date))]
  end
  
  def edition
    date.year.to_s
  end
  
  (1..5).each do |n|
    define_method "day#{n}" do
      dates.include?(Event.festival_dates(edition)[n-1])
    end
  end
  
  def duration_in_hours
    return 1 if starts_at_before_type_cast.nil? || ends_at.nil? #|| read_attribute(:starts_at) > read_attribute(:ends_at)
    dur = ((read_attribute(:ends_at) - read_attribute(:starts_at))/3600)
    ((dur*12).round.to_f/12) % 24
  end
  
  def full_date_string
    date
  end

  def number_of_related_events
    self[:number_of_related_events].presence || 3
  end

  def number_of_related_pages
    self[:number_of_related_pages].presence || 3
  end

  def venue_name
    venue.to_s
  end
  
  def starts_at
    read_attribute(:starts_at).try(:strftime,'%H:%M')
  end
  alias_method :starts_at_before_type_cast, :starts_at
  
  def starts_at_hour
    read_attribute(:starts_at).hour + (read_attribute(:starts_at).min.to_f / 60)
  end
  
  def starts_at_offset(hour)
    return nil if read_attribute(:starts_at).nil?
    off = (read_attribute(:starts_at).seconds_since_midnight - (hour*3600))/3600
    (off*12).round.to_f/12
  end
  
  def ends_at
    read_attribute(:ends_at).try(:strftime,'%H:%M')
  end
  alias_method :ends_at_before_type_cast, :ends_at  
  
  def time_string
    "#{starts_at} - #{ends_at}"
  end
  
  def time_string_with_dots
    time_string.gsub(':', '.')
  end
  
  def date_time_string
    if dates.size > 1
      date_string = DateTimeSpan.new(date, until_date, "%o %b %Y")
    else
      date_string = date.strftime("%o %b %Y")
    end
    "#{date_string} #{time_string_with_dots}"
  end
  
  private
  def until_date_is_valid
    if date.present? && until_date.present? && until_date <= date
      errors.add(:until_date, "must be after the date above")
    end
  end
  
  def set_api_image_fields
    if !image.nil?
      image_for_api = image.thumb("280x")
      self.image_url_for_api = image_for_api.url
      self.image_height_for_api = image_for_api.height
    end  
  end
  
end

Event::FESTIVAL_DATES = {
  '2012' => Date.new(2012,9,19)..Date.new(2013,9,23),
  '2013' => Date.new(2013,9,26)..Date.new(2013,9,29),
  '2014' => Date.new(2014,9,18)..Date.new(2014,9,21)
}