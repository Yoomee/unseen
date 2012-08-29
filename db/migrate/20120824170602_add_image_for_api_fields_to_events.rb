class AddImageForApiFieldsToEvents < ActiveRecord::Migration
  def up
    add_column :events, :image_url_for_api, :string
    add_column :events, :image_height_for_api, :integer
  end
  
  def down
    remove_column :events, :image_url_for_api
    remove_column :events, :image_height_for_api
  end
  
end
