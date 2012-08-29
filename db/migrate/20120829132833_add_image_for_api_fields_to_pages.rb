class AddImageForApiFieldsToPages < ActiveRecord::Migration
  def change
    add_column :pages, :image_url_for_api, :string
    add_column :pages, :image_height_for_api, :integer
  end
end
