class MigrateEventsUsersToFavourites < ActiveRecord::Migration
  def up
    Favourite.unscoped.each do |favourite|
      Favourite.unscoped.where(
        :user_id => favourite.user_id,
        :resource_type => favourite.resource_type,
        :resource_id => favourite.resource_id
      ).order("updated_at DESC").each_with_index do |duplicate, idx|
        duplicate.destroy unless idx.zero?
      end
    end
    Event.all.each do |event|
      event.users.each do |user|
        event.favourited_by_users << user unless event.favourited_by_users.include?(user)
      end
    end
  end

  def down
  end
end
