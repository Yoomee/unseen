class AddLocationInfoToUser < ActiveRecord::Migration
  def change
    
    add_column :users, :city, :string
    add_column :users, :country, :string
    add_column :users, :lat, :float
    add_column :users, :lng, :float
  end
end
