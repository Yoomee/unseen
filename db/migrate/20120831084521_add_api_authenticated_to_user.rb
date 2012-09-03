class AddApiAuthenticatedToUser < ActiveRecord::Migration
  def change
    add_column :users, :api_authenticated, :boolean, :default => false
  end
end
