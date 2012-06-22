class TagsController < ApplicationController
  
  include YmTags::TagsController
  
  def show
    @taggings = current_tag.taggings.order("created_at DESC")
    @taggables = @taggings.collect(&:taggable)
  end
  
end