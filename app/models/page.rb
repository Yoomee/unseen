class Page < ActiveRecord::Base
  
  include YmCore::Model
  include YmCms::Page
  
  has_one :slideshow, :as => :attachable
  accepts_nested_attributes_for :slideshow, :reject_if => :all_blank
  before_save :delete_slideshow_if_no_slides
  
  has_snippets :gallery_address, :gallery_phone, :gallery_fax, :gallery_email, :gallery_website, :gallery_facebook, :gallery_hours, :text_second, :news_category
  
  validates :gallery_email, :email => true, :allow_blank => true
  validates :gallery_website, :url => true, :allow_blank => true
  
  class << self
    def view_names
      %w{basic tiled list gallery galleries news news_list about press}
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