class CreateEventsGalleriesAndEventsPhotographers < ActiveRecord::Migration
  def change
    create_table :events_galleries, :id => false do |t|
      t.integer :event_id
      t.integer :page_id  
    end
    
    create_table :events_photographers, :id => false do |t|
      t.integer :event_id
      t.integer :user_id
    end
    
  end
  
end
