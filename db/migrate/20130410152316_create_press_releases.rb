class CreatePressReleases < ActiveRecord::Migration
  def change
    create_table :press_releases do |t|
      t.string :title
      t.date :date
      t.string :file_uid
      t.string :file_name
      t.timestamps
    end
  end
end
