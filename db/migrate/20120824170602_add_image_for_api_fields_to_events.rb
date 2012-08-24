class AddImageForApiFieldsToEvents < ActiveRecord::Migration
  def up
    add_column :events, :image_url_for_api, :string
    add_column :events, :image_height_for_api, :integer
    Event.reset_column_information
    Event.all.each do |e|
      e.send(:set_api_image_fields)
      e.save
    end
  end
  
  def down
    remove_column :events, :image_url_for_api
    remove_column :events, :image_height_for_api
  end
  
end
