class MovePageNewsCategoryDataToTags < ActiveRecord::Migration
  
  def self.up
    Snippet.where(:item_type => 'Page', :name => 'news_category').each do |snippet|
      page = snippet.item
      if page.update_attribute(:category_list, page.category_list + [snippet.text])
        snippet.destroy
      end
    end
  end

  def self.down
    Page.all.each do |page|
      page.category_list.each {|category| Snippet.create(:item => page, :name => 'news_category', :text => category.titleize.humanize)}
      page.update_attribute(:category_list, [])
    end
  end
  
end
