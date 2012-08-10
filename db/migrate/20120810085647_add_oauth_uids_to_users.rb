class AddOauthUidsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :facebook_uid, :string
    add_column :users, :linkedin_uid, :string
    add_column :users, :twitter_uid, :string
  end
end
