class AddEditionToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :edition, :string
    add_column :users, :photographer_parent_id, :integer
    User.reset_column_information
    User.find_all_by_role("photographer").each do |u|
     p = PhotographerParent.create
     u.update_attributes(:photographer_parent_id => p.id, :edition => "2012")
    end
  end
  
  def self.down
    remove_column :users, :edition 
    remove_column :users, :photographer_parent_id
  end
  
end
