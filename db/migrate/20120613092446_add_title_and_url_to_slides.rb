class AddTitleAndUrlToSlides < ActiveRecord::Migration
  
  def self.up
    add_column :slides, :title, :string, :before => :caption
    add_column :slides, :url, :string, :after => :caption
    Slide.reset_column_information
    Slide.all.each do |slide|
      slide.update_attribute(:title, slide.caption)
      slide.update_attribute(:caption, nil)
    end
  end
  
  def self.down
    Slide.all.each do |slide|
      slide.update_attribute(:caption, slide.title) if slide.caption.blank?
    end
    remove_column :slides, :title
    remove_column :slides, :url
  end
  
end