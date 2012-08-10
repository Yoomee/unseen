class CreateGalleriesPhotos < ActiveRecord::Migration
  
  def up
    create_table :galleries_photos, :id => false do |t|
      t.belongs_to :gallery
      t.belongs_to :photo
    end
    Page.find_by_slug("galleries").children.each do |gallery|
      gallery.photos = gallery.photographers.collect(&:photos).flatten
    end
  end
  
  def down
    drop_table :galleries_photos
  end
  
end
