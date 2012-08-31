class CreateCallToActions < ActiveRecord::Migration
  def change
    create_table :call_to_actions do |t|
      t.string :image_uid
      t.string :url
      t.timestamps
    end
  end
end
