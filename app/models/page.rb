class Page < ActiveRecord::Base
  
  include YmCms::Page
  
  has_one :slideshow, :as => :attachable, :dependent => :destroy
  has_and_belongs_to_many :photographers, :class_name => "User", :join_table => "galleries_photographers"
  has_and_belongs_to_many :galleries, :class_name => "Page", :join_table => "galleries_pages", :foreign_key => "page_id", :association_foreign_key => "gallery_id"
  has_and_belongs_to_many :news_pages, :class_name => "Page", :join_table => "galleries_pages", :foreign_key => "gallery_id", :association_foreign_key => "page_id"
  
  has_and_belongs_to_many :photos, :class_name => "Photo", :join_table => "galleries_photos", :foreign_key => "gallery_id"
  
  accepts_nested_attributes_for :slideshow, :reject_if => :all_blank
  
  before_save :delete_slideshow_if_no_slides
  before_save :set_api_image_fields
  
  has_snippets :gallery_address, :gallery_phone, :gallery_fax, :gallery_email, :gallery_website, :gallery_facebook, :gallery_hours, :text_second, :news_category, :fair_title_1, :fair_title_2, :fair_title_3, :fair_title_4, :fair_1, :fair_2, :fair_3, :fair_4, :fair_5, :fair_6, :navigation_title, :image_caption
  
  acts_as_taggable_on :categories, :page_tags
  
  validates :gallery_email, :email => true, :allow_blank => true
  validates :gallery_website, :url => true, :allow_blank => true  
  
  define_index do
    where "draft = 0 AND publication_date <= NOW()"
    indexes title, :sortable => true
    indexes text
    has parent_id, publication_date, view_name, created_at, updated_at
  end
  
  class << self
    def view_names
      %w{basic tiled list gallery galleries news news_list about press fair persona_page amsterdam}
    end
  end
  
  def has_gallery_contact_details?
    [gallery_address, gallery_phone, gallery_email, gallery_website].any?(&:present?)
  end
  
  def contact_details
    parts = []
    parts << gallery_address + "\n" unless gallery_address.blank?
    parts << "t:#{gallery_phone}" unless gallery_phone.blank?
    parts << "e:#{gallery_email}" unless gallery_email.blank?
    parts << "w:#{gallery_website}" unless gallery_website.blank?
    parts.join('\n')
  end
  
  
  private
  def delete_slideshow_if_no_slides
    slideshow.mark_for_destruction if slideshow && slideshow.slides.size.zero?
  end
  
  def set_api_image_fields
    if !image.nil? && (image_url_for_api.blank? || image_uid_changed?)
      image_for_api = image.thumb("280x")
      self.image_url_for_api = image_for_api.url
      self.image_height_for_api = image_for_api.height
    end  
  end
  
  
end
Page::NEWS_CATEGORIES = %w{collecting photographers galleries announcements fair-festival}