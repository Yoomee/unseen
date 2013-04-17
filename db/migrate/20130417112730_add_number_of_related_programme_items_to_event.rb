class AddNumberOfRelatedProgrammeItemsToEvent < ActiveRecord::Migration
  def change
    add_column :events, :number_of_related_programme_items, :integer
  end
end
