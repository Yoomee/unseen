class CreateRelatedItems < ActiveRecord::Migration
  def change
    create_table :related_items do |t|
      t.references :resource, :polymorphic => true
      t.references :item, :polymorphic => true

      t.timestamps
    end
    add_index :related_items, [:resource_id, :resource_type]
    add_index :related_items, [:item_id, :item_type]
  end
end
