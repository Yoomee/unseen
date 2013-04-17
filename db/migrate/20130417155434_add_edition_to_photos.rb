class AddEditionToPhotos < ActiveRecord::Migration
  
  def self.up
    add_column :photos, :edition, :string
    Photo.reset_column_information
    User.find_all_by_role("photographer").each do |photographer|
      photographer.photos.update_all(:edition => photographer.edition)
    end
  end
  
  def self.down
    remove_column :photos, :edition
  end
  
end