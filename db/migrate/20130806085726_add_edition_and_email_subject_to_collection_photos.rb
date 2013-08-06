class AddEditionAndEmailSubjectToCollectionPhotos < ActiveRecord::Migration
  def up
    add_column :collection_photos, :edition, :string
    add_column :collection_photos, :email_cc, :string
    add_column :collection_photos, :email_subject, :string
    CollectionPhoto.reset_column_information
    CollectionPhoto.update_all(:edition => "2012")
  end
  
  def down
    remove_columns :collection_photos, :edition, :email_cc, :email_subject
  end

end
