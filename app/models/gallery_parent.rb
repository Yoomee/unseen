# Each indivual gallery can have multiple profiles (eg. one for each year's edition)
# So this model provides a way to group together profiles that are for the same gallery

class GalleryParent < ActiveRecord::Base
  
  has_many :galleries, :class_name => "Page"

end
