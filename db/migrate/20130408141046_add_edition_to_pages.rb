class AddEditionToPages < ActiveRecord::Migration
  def up
    add_column :pages, :edition, :string
    add_column :pages, :gallery_parent_id, :integer
    Page.reset_column_information
    Page.find_by_slug(:galleries).update_attribute(:edition, '2012')
    Permalink.find_by_path(:galleries).update_attribute(:path, 'galleries-2012')
    Page.create(:title => 'Galleries 2013', :text => 'Galleries for 2013', :slug => 'galleries_2013', :view_name => :galleries, :edition => 2013, :user_id => 7, :permalink_path => 'galleries-2013')
  end
  
  def down
    remove_column :pages, :edition, :string
    remove_column :pages, :gallery_parent_id, :integer
  end
end
