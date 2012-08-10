class ChangePhotosUsersToFavouritedPhotos < ActiveRecord::Migration
  def change
    Photo.popular.each do |photo|
      photo.collected_by_users.each do |user|
        user.favourites.create(:resource => photo)
      end
    end
    drop_table :photos_users
  end
  
  def down
    Favourite.where(:resource_type => "Photo").destroy_all
    create_table :photos_users, :id => false do |t|
      t.belongs_to :photo
      t.belongs_to :user
    end
  end
end
