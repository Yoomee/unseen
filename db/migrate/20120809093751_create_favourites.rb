class CreateFavourites < ActiveRecord::Migration

  def change
    create_table :favourites do |t|
      t.belongs_to :user
      t.belongs_to :resource, :polymorphic => true
      t.timestamps
    end
    add_index :favourites, :user_id
    add_index :favourites, [:resource_type, :resource_id]
  end

end
