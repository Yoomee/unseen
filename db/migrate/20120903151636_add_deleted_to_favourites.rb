class AddDeletedToFavourites < ActiveRecord::Migration
  def change
    add_column :favourites, :deleted, :boolean, :default => false
  end
end
