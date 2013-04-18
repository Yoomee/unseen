class AddEditionToFavourites < ActiveRecord::Migration

  def self.up
    add_column :favourites, :edition, :string
    Favourite.reset_column_information
    Event.joins(:favourites).group('events.id').each do |event|
      event.favourites.update_all(:edition => event.edition)
    end
    Page.joins(:favourites).group('pages.id').each do |page|
      page.favourites.update_all(:edition => page.edition)
    end
    Photo.joins(:favourites).group('photos.id').each do |photo|
      photo.favourites.update_all(:edition => photo.edition)
    end
    User.joins(:favourites_as_photographer).group('users.id').each do |photographer|
      photographer.favourites_as_photographer.update_all(:edition => photographer.edition)
    end
  end
  
  def self.down
    remove_column :favourites, :edition
  end


end
