class MergeDuplicateEvents < ActiveRecord::Migration
  
  def self.up
    Event.reset_column_information
    Event.order(:date).group(:title).each do |event|
      duplicate_events = Event.where(:title => event.title).without(event)
      if duplicate_events.present?
        event.update_attribute(:until_date, duplicate_events.maximum(:date))
        duplicate_events.each(&:destroy)
      end
    end
  end

  def self.down
    # no going back
  end
  
end
