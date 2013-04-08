class CreateGalleryParents < ActiveRecord::Migration
  def up
    create_table :gallery_parents do |t|
      t.timestamps
    end
    GalleryParent.reset_column_information
    Page.find_all_by_view_name(:gallery).each do |gallery|
     parent = GalleryParent.create
     gallery.update_attributes(:gallery_parent_id => parent.id, :edition => "2012")
    end
    
  end

  def down
  end
end
