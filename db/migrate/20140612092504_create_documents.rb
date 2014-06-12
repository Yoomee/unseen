class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :name
      t.text :description
      t.string :file_uid
      t.text :file_text
      t.text :summary
      t.string :image_uid

      t.timestamps
    end
  end
end
