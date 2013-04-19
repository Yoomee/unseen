class AddImageUidToPressReleases < ActiveRecord::Migration
  
  def change
    add_column :press_releases, :image_uid, :string
  end
  
end
