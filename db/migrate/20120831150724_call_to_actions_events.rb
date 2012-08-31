class CallToActionsEvents < ActiveRecord::Migration
  def change
    create_table :call_to_actions_events, :id => false do |t|
      t.integer :call_to_action_id
      t.integer :event_id
    end
  end
end
