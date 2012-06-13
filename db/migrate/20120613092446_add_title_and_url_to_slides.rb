class AddTitleAndUrlToSlides < ActiveRecord::Migration
  def change
    add_column :slides, :title, :string, :before => :caption
    add_column :slides, :url, :string, :after => :caption
  end
end
