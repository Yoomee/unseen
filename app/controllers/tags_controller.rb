class TagsController < ApplicationController
  
  include YmTags::TagsController
  
  def show
    @taggings = current_tag.taggings.order("created_at DESC")
    @user_taggings = @taggings.where(:taggable_type => 'User')
    @other_taggings = @taggings.where('taggable_type != "User"')
    @taggables = @taggings.collect(&:taggable)
    @user_taggables = @user_taggings.collect(&:taggable)
    @other_taggables = @other_taggings.collect(&:taggable)
  end
  
end