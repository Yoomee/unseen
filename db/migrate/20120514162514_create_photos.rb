class CreatePhotos < ActiveRecord::Migration
  
  def change
    create_table :photos do |t|
      t.integer :photographer_id
      t.string :image_uid
      t.timestamps
    end
  end

end
