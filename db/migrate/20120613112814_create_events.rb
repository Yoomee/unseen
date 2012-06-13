class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.date :date
      t.time :starts_at
      t.time :ends_at
      t.belongs_to :venue
      t.string :image_uid
      t.text :description
      t.string :buy_tickets_url
      t.timestamps
    end
    add_index :events, :venue_id
    add_index :events, :date
  end
end
