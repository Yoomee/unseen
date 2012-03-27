class CreatePosts < ActiveRecord::Migration
  
  def change
    create_table :posts do |t|
      t.belongs_to :user
      t.text :text
      t.string :image_uid
      t.belongs_to :target, :polymorphic => true
      t.timestamps
    end
    add_index :posts, [:target_id, :target_type]
  end
  
end