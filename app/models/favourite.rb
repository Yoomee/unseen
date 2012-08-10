class Favourite < ActiveRecord::Base

  belongs_to :user
  belongs_to :resource, :polymorphic => true

  validates_presence_of :user, :resource
  
  scope :photos, where("resource_type = 'Photo' OR resource_type = 'Slide'").includes(:resource)
  scope :not_photos, where("resource_type != 'Photo' AND resource_type != 'Slide'").includes(:resource)

  def humanized_resource_type
    case resource_type
    when "User"
      "Photographer"
    when "Page"
      "Gallery"
    when "Slide"
      "Photo"
    else
      resource_type
    end    
  end

end