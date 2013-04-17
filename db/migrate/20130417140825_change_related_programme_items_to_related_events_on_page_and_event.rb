class ChangeRelatedProgrammeItemsToRelatedEventsOnPageAndEvent < ActiveRecord::Migration
  def change
    rename_column :pages, :number_of_related_programme_items, :number_of_related_events
    rename_column :events, :number_of_related_programme_items, :number_of_related_events
  end
end
