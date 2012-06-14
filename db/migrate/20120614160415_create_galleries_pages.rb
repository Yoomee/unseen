class CreateGalleriesPages < ActiveRecord::Migration

  def change
    create_table :galleries_pages, :id => false do |t|
      t.integer :gallery_id
      t.integer :page_id
    end
  end

end
