class Page < ActiveRecord::Base
  
  include YmCms::Page
  
  has_one :slideshow, :as => :attachable, :dependent => :destroy
  has_and_belongs_to_many :photographers, :class_name => "User", :join_table => "galleries_photographers"
  has_and_belongs_to_many :galleries, :class_name => "Page", :join_table => "galleries_pages", :foreign_key => "page_id", :association_foreign_key => "gallery_id"
  has_and_belongs_to_many :news_pages, :class_name => "Page", :join_table => "galleries_pages", :foreign_key => "gallery_id", :association_foreign_key => "page_id"
  
  accepts_nested_attributes_for :slideshow, :reject_if => :all_blank
  
  before_save :delete_slideshow_if_no_slides
  
  has_snippets :gallery_address, :gallery_phone, :gallery_fax, :gallery_email, :gallery_website, :gallery_facebook, :gallery_hours, :text_second, :news_category, :fair_title_1, :fair_title_2, :fair_title_3, :fair_title_4, :fair_1, :fair_2, :fair_3, :fair_4, :fair_5, :fair_6, :navigation_title, :image_caption
  
  acts_as_taggable_on :categories, :page_tags
  
  validates :gallery_email, :email => true, :allow_blank => true
  validates :gallery_website, :url => true, :allow_blank => true  
  
  define_index do
    where sanitize_sql(["published_at IS NOT NULL AND published_at >= ?", Time.now])
    indexes title, :sortable => true
    indexes text
    has parent_id, published_at, view_name, created_at, updated_at
  end
  
  class << self
    def view_names
      %w{basic tiled list gallery galleries news news_list about press fair persona_page amsterdam}
    end
  end
  
  def has_gallery_contact_details?
    [gallery_address, gallery_phone, gallery_email, gallery_website].any?(&:present?)
  end
  
  private
  def delete_slideshow_if_no_slides
    slideshow.mark_for_destruction if slideshow && slideshow.slides.size.zero?
  end
  
end
Page::NEWS_CATEGORIES = %w{collecting photographers galleries announcements festival}