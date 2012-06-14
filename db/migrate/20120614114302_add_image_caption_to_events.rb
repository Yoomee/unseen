class AddImageCaptionToEvents < ActiveRecord::Migration
  def change
    add_column :events, :image_caption, :text, :after => :image_uid
  end
end
