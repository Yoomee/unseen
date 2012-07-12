class Tag < ActsAsTaggableOn::Tag
  include YmTags::Tag
  
  scope :user_tags, contexts(:user_tags).order(:name)
  
end
