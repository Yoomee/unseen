class CreateCollectionPhotos < ActiveRecord::Migration

  def change
    create_table :collection_photos do |t|
      t.string :image_uid      
      t.string :line1
      t.string :line2
      t.text :text1
      t.text :text2
      t.string :email
      t.timestamps
    end
  end

end
