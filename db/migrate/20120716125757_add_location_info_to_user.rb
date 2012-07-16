class AddLocationInfoToUser < ActiveRecord::Migration
  def change
    
    add_column :users, :city, :string
    add_column :users, :postcode, :string
    add_column :users, :lat, :string
    add_column :users, :lng, :string
  end
end
