class TagsController < ApplicationController
  
  include YmTags::TagsController
  
  def show
    @taggings = current_tag.taggings.order("created_at DESC")
    @user_taggings = @taggings.where(:taggable_type => 'User')
    @other_taggings = @taggings.where('taggable_type != "User"')
    @taggables = @taggings.collect(&:taggable)
    @user_taggables = @user_taggings.collect(&:taggable)
    if current_tag == Tag.find_by_name('premiere')
      user_ids = @user_taggables.collect(&:id)
      @user_taggables = User.where('id IN (?) AND photographer_parent_id IS NOT NULL', user_ids)
    end
    @other_taggables = @other_taggings.collect(&:taggable)
  end
  
end