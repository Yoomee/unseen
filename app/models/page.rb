class Page < ActiveRecord::Base
  
  include YmCore::Model
  include YmCms::Page
  
  has_snippets :gallery_address, :gallery_phone, :gallery_email, :gallery_website, :gallery_hours
  
  validates :gallery_email, :email => true, :allow_blank => true
  validates :gallery_website, :url => true, :allow_blank => true
  
  class << self
    def view_names
      %w{basic tiled list gallery}
    end
  end
  
  def has_gallery_contact_details?
    [gallery_address, gallery_phone, gallery_email, gallery_website].any?(&:present?)
  end
  
end