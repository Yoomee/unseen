class CreatePhotographerParents < ActiveRecord::Migration
  def change
    create_table :photographer_parents do |t|
      t.timestamps
    end
  end
end
