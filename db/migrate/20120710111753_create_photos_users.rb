class CreatePhotosUsers < ActiveRecord::Migration
  def change
    create_table :photos_users, :id => false do |t|
      t.belongs_to :photo
      t.belongs_to :user
    end
  end
end
