class AddNumberOfRelatedProgrammeItemsToPage < ActiveRecord::Migration
  def change
    add_column :pages, :number_of_related_programme_items, :integer
  end
end
