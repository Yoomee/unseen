class AddNumberOfRelatedPagesToEvent < ActiveRecord::Migration
  def change
    add_column :events, :number_of_related_pages, :integer
  end
end
