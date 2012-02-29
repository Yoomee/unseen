class Page < ActiveRecord::Base
  
  include YmCore::Model
  include YmCms::Page
  
  has_snippets :gallery_address, :gallery_phone, :gallery_email, :gallery_website, :gallery_hours
  
  class << self
    def view_names
      %w{basic tiled list gallery}
    end
  end
  
end