class AddPublishedAtToPages < ActiveRecord::Migration
  
  def self.up
    add_column :pages, :published_at, :datetime, :null => true, :default => nil
    Page.reset_column_information
    Page.all.each do |page|
      page.update_attribute(:published_at, Time.now) if page.read_attribute(:published)
    end
    remove_column :pages, :published
  end
  
  def self.down
    add_column :pages, :published, :boolean, :default => false
    Page.reset_column_information    
    Page.all.each do |page|
      page.update_attribute(:published, true) if page.published_at && page.published_at <= Time.now
    end
    remove_column :pages, :published_at
  end
  
end