class CreateCallToActionsPages < ActiveRecord::Migration
  def change
    create_table :call_to_actions_pages, :id => false do |t|
      t.integer :call_to_action_id
      t.integer :page_id
    end
  end
end
