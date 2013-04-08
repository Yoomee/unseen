class AddEditionToPages < ActiveRecord::Migration
  def change
    add_column :pages, :edition, :string
    add_column :pages, :gallery_parent_id, :integer
  end
end
