class CreateGalleriesPhotographers < ActiveRecord::Migration

  def change
    create_table :galleries_photographers, :id => false do |t|
      t.integer :page_id
      t.integer :user_id
    end
  end

end
