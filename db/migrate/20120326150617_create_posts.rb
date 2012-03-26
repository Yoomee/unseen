class CreatePosts < ActiveRecord::Migration
  
  def change
    create_table :posts do |t|
      t.belongs_to :user
      t.text :text
      t.string :image_uid
      t.timestamps
    end
  end
  
end