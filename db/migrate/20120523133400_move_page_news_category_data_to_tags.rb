class MovePageNewsCategoryDataToTags < ActiveRecord::Migration
  
  def self.up
    Snippet.where(:item_type => 'Page', :name => 'news_category').each do |snippet|
      page = snippet.item
      page.category_list << snippet.text
      page.save
      snippet.destroy
    end
  end

  def self.down
    Page.all.each do |page|
      page.category_list.each {|category| Snippet.create(:item => page, :name => 'news_category', :text => category.humanize)}
      page.category_list = []
      page.save
    end
  end
  
end
