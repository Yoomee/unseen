class AddUntilDateToEvents < ActiveRecord::Migration

  def change
    add_column :events, :until_date, :date, :after => :date
  end
  
end
